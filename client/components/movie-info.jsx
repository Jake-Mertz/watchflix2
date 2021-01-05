import React from 'react';

class MovieInfo extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      product: null,
      view: { name: 'movie-info' }
    };
    this.backToCatalog = this.backToCatalog.bind(this);
  }

  componentDidMount() {
    fetch(`api/movies/${this.props.details.id}`, { method: 'GET' })
      .then(res => res.json())
      .then(data => this.setState({ product: data }))
      .catch(err => console.error('Movie is unavailable', err));
  }

  backToCatalog() {
    this.props.setView('movie-list', {});
  }

  render() {
    if (this.state.product === null) {
      return (
        <div>
          <h1>Movie could not be found</h1>
          <button onClick={this.backToCatalog}>Back to Catalog</button>
        </div>
      );
    } else if (this.state.product !== null) {
      return (
        <div>
          <button onClick={this.backToCatalog} className="movie-info-back">Back to Catalog</button>
          <div>
            <img
              src={this.state.product[0].image}
              className="movie-info-image"
            ></img>
          </div>
          <div>
            <h1>{this.state.product[0].title}</h1>
            <h2>{this.state.product[0].genre}</h2>
            <h3>{this.state.product[0].year}</h3>
            <p>{this.state.product[0].description}</p>
          </div>
        </div>
      );
    }
  }
}

export default MovieInfo;
