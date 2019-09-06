import React, { Component } from 'react';
import Camera from 'react-html5-camera-photo';
import 'react-html5-camera-photo/build/css/index.css';
//npm install --save react-html5-camera-photo
//yarn add react-html5-camera-photo
 
class Camera extends Component {
  onTakePhoto (photo) {
    // Do stuff with the photo photo...
    console.log('took photo - components/camera');
  }

  onCameraError (error) {
    console.error('Error:', error);
  }

  onCameraStop () {
    console.log('camera off');
  }
 
  render () {
    return (
      <div className="Camera">
        <Camera
          onTakePhoto = { (photo) => { this.onTakePhoto(photo); } }
          onCameraStart = { (stream) => { this.onCameraStart(stream); } }
          onCameraStop = { () => { this.onCameraStop(); } }
          idealResolution = {{width: 640, height: 480}}
          imageType = {IMAGE_TYPES.JPG}
          imageCompression = {0.97}
          isMaxResolution = {false}
          isImageMirror = {false}
        />
      </div>
    );
  }
}
 
export default Camera;