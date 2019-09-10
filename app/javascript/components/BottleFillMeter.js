/* import React from "react";
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
  
  <img style={{ width: 60, marginTop: -5 }} src="https://ww1.valuecellars.com.au/files/2016/06/682430611768-1.png" alt="doge" />
  <div style={{ fontSize: 20, marginTop: -5 }}>

    <strong>{percentage}%</strong> full
    <strong>{name}</strong>

  </div>
</CircularProgressbarWithChildren>
)
}
 */