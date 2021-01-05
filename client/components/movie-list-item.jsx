import React from 'react';

function MovieListItem(props) {
  return (
    <div onClick={() => props.setView('movie-info', { id: props.id })}>
      <img className="movie-image" src={props.image} alt="movie poster"></img>
      <div>
        <h1 className="movie-title">{props.title}</h1>
        <p>{props.genre}</p>
        <p>{props.year}</p>
        <p>{props.description}</p>
      </div>
    </div>
  );
}

export default MovieListItem;
