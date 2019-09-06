import React from "react";
import { CircularProgressbarWithChildren, buildStyles } from 'react-circular-progressbar';
import 'react-circular-progressbar/dist/styles.css';

export default function BottleFillMeter(props){

//turn to props.percentage    
const percentage = 66;
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
    <strong>{percentage}%</strong> mate
  </div>
</CircularProgressbarWithChildren>
)
}

