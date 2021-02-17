import React from 'react';
import MovieListItem from './movie-list-item';
import { Scrollbars } from 'react-custom-scrollbars';
import MyListItem from './my-list-item';

class MovieList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      movies: [],
      list: props.listData
    };
    // this.getMovies = this.getMovies.bind(this);
    this.myList = this.myList.bind(this);
  }

  componentDidMount() {
    this.getMovies();
  }

  getMovies() {
    fetch('api/movies', { method: 'GET' })
      .then(res => res.json())
      .then(data => this.setState({ movies: data }));
  }

  myList() {
    const movieListRender = this.state.movies.map((movie, index) => {
      return (
        <div key={movie.productId + (index * 1000)} className="movie-list-item">
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
    const myListRender = this.props.listData.map(movie => {
      return (
        <div key={this.state.list.listItemId}>
          <MyListItem
            title={movie.title}
            year={movie.year}
            genre={movie.genre}
            id={movie.listItemId}
            image={movie.image}
            description={movie.description}
          />
        </div>
      );
    });
    if (myListRender.length === 0) {
      return (
        <div className="all-lists-render">
          <div>
            <h1 className="my-list-title">My List</h1>
            <Scrollbars style={{ width: 1200, height: 300 }} className="movie-list-scrollbar">
              <div className="my-list">Your List is Empty!</div>
            </Scrollbars>
          </div>
          <div>
            <h1 className="new-titles-title">New Titles</h1>
          </div>
          <Scrollbars style={{ width: 1200, height: 300 }} className="movie-list-scrollbar">
            <div className="movie-list">{movieListRender}</div>
          </Scrollbars>
        </div>
      );
    } else {
      return (
        <div className="all-lists-render">
          <div>
            <h1 className="my-list-title">My List</h1>
            <Scrollbars style={{ width: 1200, height: 300 }} className="movie-list-scrollbar">
              <div className="movie-list">{myListRender}</div>
            </Scrollbars>
          </div>
          <div>
            <h1 className="new-titles-title">New Titles</h1>
          </div>
          <Scrollbars style={{ width: 1200, height: 300 }} className="movie-list-scrollbar">
            <div className="movie-list">{movieListRender}</div>
          </Scrollbars>
        </div>
      );
    }
  }

  render() {

    // function MyList() {
    //   const movieListRender = this.state.movies.map((movie, index) => {
    //     return (
    //       <div key={movie.productId + (index * 1000)} className="movie-list-item">
    //         <MovieListItem
    //           title={movie.title}
    //           year={movie.year}
    //           genre={movie.genre}
    //           id={movie.productId}
    //           image={movie.image}
    //           description={movie.description}
    //           setView={this.props.setView}
    //         />
    //       </div>
    //     );
    //   });

    //   const myListRender = this.state.list.map(movie => {
    //     return (
    //       <div key={this.state.list.listItemId}>
    //         <MyListItem
    //           title={movie.title}
    //           year={movie.year}
    //           genre={movie.genre}
    //           id={movie.listItemId}
    //           image={movie.image}
    //           description={movie.description}
    //         />
    //       </div>
    //     );
    //   });
    //   if (myListRender.length === 0) {
    //     return (
    //       <div className="all-lists-render">
    //         <div>
    //           <h1 className="my-list-title">My List</h1>
    //           <Scrollbars style={{ width: 1200, height: 300 }} className="movie-list-scrollbar">
    //             <div className="my-list">Your List is Empty!</div>
    //           </Scrollbars>
    //         </div>
    //         <div>
    //           <h1 className="new-titles-title">New Titles</h1>
    //         </div>
    //         <Scrollbars style={{ width: 1200, height: 300 }} className="movie-list-scrollbar">
    //           <div className="movie-list">{movieListRender}</div>
    //         </Scrollbars>
    //       </div>
    //     );
    //   } else {
    //     return (
    //       <div className="all-lists-render">
    //         <div>
    //           <h1 className="my-list-title">My List</h1>
    //           <Scrollbars style={{ width: 1200, height: 300 }} className="movie-list-scrollbar">
    //             <div className="movie-list">{myListRender}</div>
    //           </Scrollbars>
    //         </div>
    //         <div>
    //           <h1 className="new-titles-title">New Titles</h1>
    //         </div>
    //         <Scrollbars style={{ width: 1200, height: 300 }} className="movie-list-scrollbar">
    //           <div className="movie-list">{movieListRender}</div>
    //         </Scrollbars>
    //       </div>
    //     );
    //   }
    // }
    return (
      <div>{this.myList()}</div>
    );
  }
}

export default MovieList;
