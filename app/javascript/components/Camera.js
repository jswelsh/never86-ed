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
  


  render () {
    return (
      <div>
        <video
          ref={this.videoRef}
          autoPlay="true"
          //this is experimental but could be useful
          //autoPictureInPicture="true"
        />
        <button onClick={ () => {
          //can switch to front via MODES.USER... n/v useful?
          let facingMode = FACING_MODES.ENVIRONMENT;
          //these need to be altered in light of TF requirements
          let idealResolution = { width: 400, height: 400 };
          this.startCamera(facingMode, idealResolution);
        }}> Start environment facingMode resolution ideal 640 by 480 </button>

        <button onClick={ () => {
          this.takePhoto();
        }}> Take photo </button>
        <button onClick={ () => {
          this.stopCamera();
        }}> Stop </button>

        <img
          alt="Image"
          src={this.state.dataUri}
        />
      </div>
    );
  }

}

export default Camera;