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

