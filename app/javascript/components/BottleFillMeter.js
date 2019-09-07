import React from "react";
import { CircularProgressbarWithChildren, buildStyles } from 'react-circular-progressbar';
//import 'react-circular-progressbar/dist/styles.css';

//import "components/BottleHistoryFillMeter.css";


export default function BottleFillMeter(props){

//turn to props.percentage    
const percentage = 66;
//props.name
const name = "Voss"
//turn to props.bottleImage  
//const bottleImage = props;
return(


<CircularProgressbarWithChildren 
  value={percentage}
  styles={buildStyles({
    pathColor: '#6ea4bf',
    trailColor: '#6b2d5c',
  })}>
  {/* Put any JSX content in here that you'd like. It'll be vertically and horizonally centered. */}
  <img style={{ width: 60, marginTop: -5 }} src="https://ww1.valuecellars.com.au/files/2016/06/682430611768-1.png" alt="doge" />
  <div style={{ fontSize: 20, marginTop: -5 }}>
    <strong>{percentage}%</strong> full
    <strong>{name}</strong>
  </div>
</CircularProgressbarWithChildren>
)
}

import React from "react";
import ProgressBar from 'react-bootstrap/ProgressBar'

import "components/BottleHistoryFillMeter.css";

export default function BottleHistoryFillMeter(props){

//turn to props.percentage
//full, eighty, sixty, forty... conditional fomating for color   
const percentage = "eighty";
//need to get the bar to render in different colors
return(
  <div>
    <ProgressBar variant={percentage} now={40} />
  </div>
)
}