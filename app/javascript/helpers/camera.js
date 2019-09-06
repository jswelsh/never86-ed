//export function camera() {
//HTML DOM querySelector() Method
/*The querySelector() method returns the first child element 
  that matches a specified CSS selector(s) of an element.
  
  create css file an pseudo html

  The MediaDevices interface provides access to connected 
  media input devices like cameras and microphones, as well 
  as screen sharing. In essence, it lets you obtain access 
  to any hardware source of media data.
  https://developer.mozilla.org/en-US/docs/Web/API/MediaDevices
  */  

//pick the style of selector, query selector works, but...
/* const cameraView = document.querySelector("#camera--view"),
        cameraOutput = document.querySelector("#camera--output"),
        cameraSensor = document.querySelector("#camera--sensor"),
        cameraTrigger = document.querySelector("#camera--trigger")
 */  

function cameraStart() {
    navigator.mediaDevices
        .getUserMedia(constraints)
        .then(function(stream) {
        track = stream.getTracks()[0];
        cameraView.srcObject = stream;
    })
    .catch(function(error) {
        console.error("Error", error);
    });
}

cameraTrigger.onclick = function() {
    cameraSensor.width = cameraView.videoWidth;
    cameraSensor.height = cameraView.videoHeight;
    cameraSensor.getContext("2d").drawImage(cameraView, 0, 0);
    cameraOutput.src = cameraSensor.toDataURL("image/webp");
    cameraOutput.classList.add("taken");
};

//}
//window.addEventListener("load", cameraStart, false);
