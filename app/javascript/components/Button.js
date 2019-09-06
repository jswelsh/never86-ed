/* import React from "react";
import Button from 'react-bootstrap/Button'

var classnames = require('classnames');

export default function Button(props) {
   const buttonVariant = classnames("button", {
     "button--danger": props.danger,
     "button--confirm": props.confirm
   });
 
    return (
      <button
        className={buttonClass}
        onClick={props.onClick}
        disabled={props.disabled}
      >
        {props.children}
      </button>
   );
 }

 <Button variant={buttonVariant} size="lg" type='button' onSubmit={console.log("button on click")}>
 Large button
</Button> */