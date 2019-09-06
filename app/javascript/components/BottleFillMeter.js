import React from "react";
import { CircularProgressbar } from 'react-circular-progressbar';
import 'react-circular-progressbar/dist/styles.css';

export default function BottleFillMeter(props){

//turn to props.percentage    
const percentage = props;
return(

<CircularProgressbar value={percentage} text={`${percentage}%`} />
)
}