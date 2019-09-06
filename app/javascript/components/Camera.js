import React from 'react';
import CameraPhoto, { FACING_MODES } from 'jslib-html5-camera-photo';

class App extends React.Component {
  constructor (props, context) {
    super(props, context);
    this.cameraPhoto = null;
    this.videoRef = React.createRef();
    this.state = {
      dataUri: ''
    }
  }
  componentDidMount () {
    //need to generate an instance of the cameraPhoto, mounting it 
    //so video ref can grab the the element
    this.cameraPhoto = new CameraPhoto(this.videoRef.current);
  }
  //will likely need to change mode and resolution
  startCamera (mode, resolution) {
    this.cameraPhoto.startCamera(mode, resolution)
      .then(() => {
        console.log('started from camera component');
      })
      .catch((error) => {
        console.error('Error from camera component', error);
      });
  }
  takePhoto () {
    const config = {
      sizeFactor: 1
    };

    let dataUri = this.cameraPhoto.getDataUri(config);
    this.setState({ dataUri });
  }

  stopCamera () {
    this.cameraPhoto.stopCamera()
      .then(() => {
        console.log('Camera stoped! from camera component');
      })
      .catch((error) => {
        console.log('Error:', error);
      });
  }

  render () {
    return (
      <div>
        <button onClick={ () => {
          //can switch to front via MODES.USER... n/v useful?
          let mode = FACING_MODES.ENVIRONMENT;
          //these need to be altered in light of TF requirements
          let resolution = { width: 400, height: 400 };
          this.startCamera(mode, resolution);
        }}> Start environment facingMode resolution ideal 640 by 480 </button>

        <button onClick={ () => {
          this.takePhoto();
        }}> Take photo </button>
        <button onClick={ () => {
          this.stopCamera();
        }}> Stop </button>

        <video
          ref={this.videoRef}
          autoPlay="true"
        />
        <img
          alt="Image"
          src={this.state.dataUri}
        />
      </div>
    );
  }

}

export default App;