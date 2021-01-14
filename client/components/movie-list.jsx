import React from 'react';
import MovieListItem from './movie-list-item';
import { Scrollbars } from 'react-custom-scrollbars';

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
          <h1 className="my-list-title">My List</h1>
        </div>
        <div>
          <h1 className="new-titles-title">New Titles</h1>
        </div>
        <Scrollbars style={{ width: 1200, height: 300 }}>
          <div className="movie-list">{movieListRender}</div>
        </Scrollbars>
      </div>
    );
  }
}

export default MovieList;
