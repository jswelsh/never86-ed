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
  validateMount () {
    //need to generate an instance of the cameraPhoto, mounting it 
    //so video ref can grab the the element
    this.cameraPhoto = new CameraPhoto(this.videoRef.current);
  }
  //will likely need to change mode and resolution
  startCamera (mode, res) {
    this.cameraPhoto.startCamera(mode, res)
      .then(() => {
        console.log('started from camera component');
      })
      .catch((error) => {
        console.error('Error from camera component', error);
      });
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
          let resolution = { width: 400, height: 400 };
          this.startCamera(facingMode, resolution);
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