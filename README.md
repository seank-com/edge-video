
# edge-video

This project is broken into two pieces. While exploring this solution we learned ffmpeg does not support the Jetson Nano. nVidia provides gstreamer as an alternative. This is unfortunate because a large body of open source projects that perform video stream manipulation depend on the underlying libraries within ffmpeg including the [aiortc](https://github.com/aiortc/aiortc) project which we are using to achieve WebRTC connectivity.

The first piece is [image-predict](image-predict/README.md) which produces a service in a container that can do predictions from a CustomVision model. The container runs on both Jetson Nano and large Linux machines

The second piece is [stream-handler](stream-handler/README.md) which produces a service in a contain that can connect to a WebRTC stream and send frames to the above image-predict service. 
