import React from 'react';
import MovieListItem from './movie-list-item';

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
        <div key={movie.productId} className="movie-list-item">
          <MovieListItem
            title={movie.title}
            year={movie.year}
            genre={movie.genre}
            id={movie.productId}
            image={movie.image}
            description={movie.description}
            setView={this.props.setView}
          />
        </div>
      );
    });
    return (
      <div>
        <div>
          <h1>My List</h1>
        </div>
        <div>
          <h1>New Titles</h1>
          <div className="movie-list">{movieListRender}</div>
        </div>
      </div>
    );
  }
}

export default MovieList;
