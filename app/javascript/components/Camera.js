import React, { Component } from 'react';
import Camera from 'react-html5-camera-photo';
import 'react-html5-camera-photo/build/css/index.css';
//npm install --save react-html5-camera-photo
//yarn add react-html5-camera-photo
 
class App extends Component {
  onTakePhoto (dataUri) {
    // Do stuff with the dataUri photo...
    console.log('took photo - components/camera');
  }

  onCameraError (error) {
    console.error('Error:', error);
  }
 
  render () {
    return (
      <div className="App">
        <Camera
          onTakePhoto = { (dataUri) => { this.onTakePhoto(dataUri); } }
        />
      </div>
    );
  }
}
 
export default App;