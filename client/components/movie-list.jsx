import React from 'react';
import MoviePage from './movie-page';

class MovieList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      movies: []
    };
  }

  componentDidMount() {
    this.getMovies();
  }

  getMovies() {
    fetch('api/movies', { method: 'GET' })
      .then(res => res.json())
      .then(data => this.setState({ movies: data }));
  }

  render() {
    const movieListRender = this.state.movies.map(movie => {
      return (
        <div key={movie.productId} className="movie-tn">
          <MoviePage
            title={movie.title}
            year={movie.year}
            genre={movie.genre}
            id={movie.productId}
            image={movie.image}
            description={movie.description}
          />
        </div>
      );
    });
    return (
      <div className="movie-list">{movieListRender}</div>
    );
  }
}

export default MovieList;
