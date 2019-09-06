import React from "react";
import Webcam from "react-webcam";
// need to npm install react-webcam

//need to convert into tensors use tf.image?
class Component extends React.Component {
  render() {
    return <Webcam />;
  }
}