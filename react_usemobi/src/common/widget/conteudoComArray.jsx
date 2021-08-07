import React from 'react'

function ConteudoComArray(props) {

    const arrayTextos = props.arrayTextos;
    const listItems = arrayTextos.map((item) => <p className="conteudo">{item}</p>);  

    return (
      <div>{listItems}</div>  
    );

}

export default ConteudoComArray;