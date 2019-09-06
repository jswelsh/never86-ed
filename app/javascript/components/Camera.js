import React from 'react';
import CameraPhoto, { FACING_MODES } from 'jslib-html5-camera-photo';

class Camera extends React.Component {
  constructor (props, context) {
    super(props, context);
    this.cameraPhoto = null;
    this.videoRef = React.createRef();
    this.state = {
      dataUri: ''
    }
  }
}

export default Camera;