import React from 'react';
import Container from 'react-bootstrap/Container'
import Image from 'react-bootstrap/Image'

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
      
    <div >
      <div class="camera-container"> 
       
        <div>
          <video ref={this.videoRef}autoPlay="true"/>
        </div>
         <div class="camera-button-container">
          <button class="--button" onClick={ () => {
            //can switch to front via MODES.USER... n/v useful?
            let mode = FACING_MODES.ENVIRONMENT;
            //these need to be altered in light of TF requirements
            let resolution = { width: 400, height: 400 };
            this.startCamera(mode, resolution);
          }}> Camera</button>
          <button class="--button" onClick={ () => {
            this.takePhoto();
          }}> Take photo </button>
          <button class="--button" onClick={ () => {
            this.stopCamera();
          }}> Stop </button>
        </div>
        <div>
          <video ref={this.videoRef}autoPlay="true"/>
        </div>
        <div>          
          <button class="--button" onClick={ () => {
          }}> Submit </button>
        </div>
        <div>
          {this.state.dataUri ? <Image alt="Image" src={this.state.dataUri} rounded/>: <div></div> }
        </div>

      </div>
    </div>
    );
  }

}

export default App;

