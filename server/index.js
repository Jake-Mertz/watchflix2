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

// app.get('/api/movies', (req, res, next) => {
//   if (!req.session.listId) {
//     return res.json([]);
//   }
//   const listItemSQL = `
//     select "l"."listItemId",
//     "l"."year",
//     "m"."productId",
//     "m"."image",
//     "m"."title",
//     "m"."genre",
//     "m"."description"
//     from "listItems" as "l"
//     join "movies" as "m" using ("productId")
//     where "l"."listId" = $1
//   `;
//   const listId = [req.session.listId];
//   db.query(listItemSQL, listId)
//     .then(result => {
//       const movies = result.rows;
//       res.status(200).json(
//         movies
//       );
//     })
//     .catch(err => next(err));
// });

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

app.post('/api/lists/', (req, res, next) => {
  if (!req.body.productId) {
    res.status(400).json({ error: 'Movie could not be found' });
  }
  const yearSQL = `
    select "year" from "movies"
    where "productId" = $1
  `;
  const productParams = [req.body.productId];
  db.query(yearSQL, productParams)
    .then(result => {
      const year = result.rows;
      if (year.length === 0) {
        throw new ClientError('Movie could not be found', 404);
      }
      const listSQL = `
        insert into "lists" ("listId", "createdAt")
        values (default, default)
        returning "listId"
      `;
      if (req.session.listId) {
        return {
          listId: req.session.listId,
          year: year[0].year
        };
      }
      return db.query(listSQL)
        .then(result => {
          const list = result.rows[0];
          return {
            listId: list.listId,
            year: year[0].year
          };
        });
    })
    .then(result => {
      req.session.listId = result.listId;
      const listItemSQL = `
        insert into "listItems" ("listId", "productId", "year")
        values ($1, $2, $3)
        returning "listItemId"
      `;
      const listItemParams = [result.listId, req.body.productId, result.year];
      return db.query(listItemSQL, listItemParams);
    })
    .then(result => {
      const listItemSQL = `
        select "l"."listItemId",
        "l"."year",
        "m"."productId",
        "m"."title",
        "m"."genre",
        "m"."description",
        "m"."image"
        from "listItems" as "l"
        join "movies" as "m" using ("productId")
        where "l"."listItemId" = $1
      `;
      const listItemResult = [result.rows[0].listItemId];
      return db.query(listItemSQL, listItemResult)
        .then(result => {
          res.status(201).json(result.rows[0]);
        })
        .catch(err => next(err));
    });
});

// .then(result => {
//   req.session.listId = result.listId;
//   req.session.year = result.year;
//   const listItemSQL = `
//       insert into "listItems" ("listId", "productId", "year")
//       values ($1, $2, $3)
//       returning "year"
//     `;
//   const listItemParams = [req.session.listId, productParams, req.session.year];
//   return db.query(listItemSQL, listItemParams);
// })
// .then(result => {
//   res.send('made it so far!');
// });

// .then(result => {
//   req.session.listId = result.listId;
//   res.send(200).json(result.year);
// const listItemSQL = `
//   insert into "listItems" ("listId", "productId", "year")
//   values ($1, $2, $3)
//   returning "year"
// `;
// const listItemParams = [req.session.listId, req.session.productId, req.session.year];
// return db.query(listItemSQL, listItemParams);
// .then(result => {
//   const listItemConnectSQL = `

//   `;
// });

//   const allSQL = `
//         select * from "movies"
//         where "productId" = $1
//       `;
//   return db.query(allSQL, yearParams);
// })
//   .then(result => {
//     const movieInfo = result.rows;
// res.json(movieInfo);

// if (year.length === 0) {
//   throw new ClientError('Movie could not be found', 404);
// }
// const listSQL = `
//   insert into "lists" ("listId", "createdAt")
//   values ("default", "default")
//   returning "listId"
// `;
// res.send(200).json(year);
//   if (req.session.listId) {
//     return {
//       listId: req.session.listId,
//       year: year[0].year
//     };
//   }
//   return db.query(listSQL);
// })
// .then(result => {
//   const list = result.rows[0];
//   res.send(200).json('hello!');
// });

app.get('/api/lists', (req, res, next) => {
  res.status(200).json('hello!');
});

// db.query(movieSQL, yearParams)
//   .then(result => {
//     const movieYear = result.rows;
//     res.send(movieYear);
//   });
// const product = [req.params.productId];
// db.query(movieSQL, product)
//   .then(result => {
//     const year = result.rows[0];
//     res.status(200).json(year);
// if (movie.length === 0) {
//   throw new ClientError('Movie could not be found', 404);
// }
// const listSQL = `
//   insert into "lists" ("listId", "createdAt")
//   values (default, default)
//   returning *
// `;
// if (req.session.listId) {
//   return {
//     listId: req.session.listId
//   }
// }
// return db.query(listSQL)
//   .then(result => {
//     const list = result.rows[0];
//     return {
//       listId: list.listId
//     };
//   });
// })
//   .then(result => {
//     req.session.listId = result.listId;
//     const listMovieSQL = `
//       insert into "listItems" ("listId", "productId")
//       values ($1, $2)

//     `;

// app.post('/api/lists', (req, res, next) => {
//   if (!req.body.productId) {
//     res.status(400).json({ error: 'Movie could not be found' });
//   }
//   const yearSQL = `
//     select "year" from "movies"
//     where "productId" = $1
//   `;
//   const yearParams = [req.body.year];
//   db.query(yearSQL, yearParams)
//     .then(result => {
//       const year = result.rows;
//       if (year.length === 0) {
//         throw new ClientError('Movie could not be found', 404);
//       }
//       const listSQL = `
//         insert into "lists" ("listId", "createdAt")
//         values (default, default)
//         returning "listId"
//       `;
//       if (req.session.listId) {
//         return {
//           listId: req.session.listId,
//           year: year[0].year
//         };
//       }
//       return db.query(listSQL);
//     })
//   .then(result => {
//     req.session.listId = result.listId;
//     const listItemSQL = `
//       insert into "listItems" ("listId", "productId", "year")
//       values ($1, $2, $3)
//       returning "cartItemId"
//     `;
//     const listItemParams = [result.cartId, req.body.productId, result.year];
//     return db.query(listItemSQL, listItemParams)
//       .then(result => {
//         const listItemSQL = `
//         select "l"."listItemId",
//         "l"."year",
//         "m"."productId",
//         "m"."image",
//         "m"."title",
//         "m"."genre",
//         "m"."description"
//         from "listItems" as "l"
//         join "movies" as "m" using ("productId")
//         where "m"."listItemId" = $1
//         `;
//         const listItem = [result.rows[0].listItemId];
//         return db.query(listItemSQL, listItem);
//       })
//       .then(result => {
//         res.status(201).json(result.rows[0]);
//       })
//       .catch(err => next(err));
//   });
// });

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
