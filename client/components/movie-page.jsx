import React from 'react';

function MoviePage(props) {
  return (
    <div>
      <img className="movie-image" src={props.image} alt="movie poster"></img>
      <div>
        <h1>{props.title}</h1>
        <p>{props.genre}</p>
        <p>{props.year}</p>
        <p>{props.description}</p>
      </div>
    </div>
  );
}

export default MoviePage;
