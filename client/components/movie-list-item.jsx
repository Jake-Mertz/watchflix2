import React from 'react';

function MovieListItem(props) {
  return (
    <div onClick={() => props.setView('movie-info', { id: props.id })}>
      <img className="movie-image" src={props.image} alt="movie poster"></img>
      <div>
        <h1 className="movie-title">{props.title}</h1>
        <h2 className="movie-genre">{props.genre}</h2>
        <h2 className="movie-year">{props.year}</h2>
        <h2 className="movie-description">{props.description}</h2>
      </div>
    </div>
  );
}

export default MovieListItem;
