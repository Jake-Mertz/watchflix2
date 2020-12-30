import React from 'react';

class MovieInfo extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      product: null,
      view: { name: 'movie-info' }
    };
  }

  // componentDidMount() {
  //   fetch('api/movies:productId');
  // }

  render() {
    return (
      <div>Hello</div>
    );
  }
}

export default MovieInfo;
