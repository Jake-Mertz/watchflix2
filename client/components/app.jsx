import React from 'react';
import MovieList from './movie-list';
import MovieInfo from './movie-info';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      // message: null,
      // isLoading: true
      view: {
        name: 'movie-list',
        params: {}
      },
      myList: []
    };
    this.setView = this.setView.bind(this);
  }

  setView(name, params) {
    this.setState({
      view: {
        name: name,
        params: params
      }
    });
  }

  // componentDidMount() {
  //   fetch('/api/health-check')
  //     .then(res => res.json())
  //     .then(data => this.setState({ message: data.message || data.error }))
  //     .catch(err => this.setState({ message: err.message }))
  //     .finally(() => this.setState({ isLoading: false }));
  // }

  render() {
    // return this.state.isLoading
    //   ? <h1>Testing connections...</h1>
    //   : <h1>{this.state.message}</h1>;
    let appView = null;
    if (this.state.view.name === 'movie-list') {
      appView = <MovieList
        setView={this.setView}
      />;
    }
    if (this.state.view.name === 'movie-info') {
      appView = <MovieInfo
        details={this.state.view.params}
        setView={this.setView}
      />;
    }
    return (
      <div>{appView}</div>
    );
  }
}
