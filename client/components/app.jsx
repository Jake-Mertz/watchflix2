import React from 'react';
import MovieList from './movie-list';
import MovieInfo from './movie-info';
// import MyList from './movie-list';

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
      list: []
    };
    this.setView = this.setView.bind(this);
    this.getListItems = this.getListItems.bind(this);
    this.addToMyList = this.addToMyList.bind(this);
  }

  componentDidMount() {
    // fetch('/api/health-check')
    //   .then(res => res.json())
    //   .then(data => this.setState({ message: data.message || data.error }))
    //   .catch(err => this.setState({ message: err.message }))
    //   .finally(() => this.setState({ isLoading: false }));
    this.getListItems();
  }

  setView(name, params) {
    this.setState({
      view: {
        name: name,
        params: params
      }
    });
  }

  getListItems() {
    fetch('api/lists')
      .then(res => res.json())
      .then(data => this.setState({ list: data }))
      .catch(err => console.error(err));
  }

  addToMyList(movie) {
    const newState = this.state.list.slice();
    fetch('api/lists', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ productId: movie })
    })
      .then(res => res.json())
      .then(data => newState.push(data))
      .then(() => this.setState({ list: newState }))
      .catch(err => console.error(err));
  }

  render() {
    // return this.state.isLoading
    //   ? <h1>Testing connections...</h1>
    //   : <h1>{this.state.message}</h1>;
    let appView = null;
    if (this.state.view.name === 'movie-list') {
      appView = <MovieList
        setView={this.setView}
        listData={this.state.list}
      />;
    }
    if (this.state.view.name === 'movie-info') {
      appView = <MovieInfo
        details={this.state.view.params}
        setView={this.setView}
        addToMyList={this.addToMyList}
      />;
    }
    return (
      <div className="app-view">{appView}</div>
    );
  }
}
