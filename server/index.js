require('dotenv/config');
const express = require('express');

const db = require('./database');
const ClientError = require('./client-error');
const staticMiddleware = require('./static-middleware');
const sessionMiddleware = require('./session-middleware');

const app = express();

app.use(staticMiddleware);
app.use(sessionMiddleware);

app.use(express.json());

app.get('/api/health-check', (req, res, next) => {
  db.query('select \'successfully connected\' as "message"')
    .then(result => res.json(result.rows[0]))
    .catch(err => next(err));
});

app.get('/api/movies', (req, res, next) => {
  const sql = `
  select
  "title", "year", "genre", "description", "image", "productId"
  from "movies"
  `;
  db.query(sql)
    .then(result => {
      const movies = result.rows;
      res.status(200).json(
        movies
      );
    })
    .catch(err => next(err));
});

app.get('/api/movies/:productId', (req, res, next) => {
  const sql = `
  select *
  from "movies"
  where "productId" = $1
  `;
  const productId = req.params.productId;
  const params = [productId];
  db.query(sql, params)
    .then(result => {
      const movie = result.rows;
      if (movie.length === 0) {
        return next(new ClientError('Movie is unavailable', 404));
      }
      res.status(200).json(
        movie
      );
    })
    .catch(err => next(err));
});

app.get('api/myList');

app.use('/api', (req, res, next) => {
  next(new ClientError(`cannot ${req.method} ${req.originalUrl}`, 404));
});

app.use((err, req, res, next) => {
  if (err instanceof ClientError) {
    res.status(err.status).json({ error: err.message });
  } else {
    console.error(err);
    res.status(500).json({
      error: 'an unexpected error occurred'
    });
  }
});

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log('Listening on port', process.env.PORT);
});
