import React from 'react';

function MyListItem(props) {
  return (
    <div>
      <div>
        <img src={props.image}></img>
      </div>
      <div>
        <h1>{props.title}</h1>
        <h2>{props.year}</h2>
        <h2>{props.genre}</h2>
        <h3>{props.description}</h3>
      </div>
    </div>
  );
}

export default MyListItem;
