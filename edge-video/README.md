# WebRTC Dockerfile

This example illustrates establishing audio, video and a data channel with a
browser. It also performs some image processing on the video frames using
OpenCV.


    $ pip3 install aiohttp aiortc opencv-python
    $ python server.py

You can then browse to the following page with your browser:

http://127.0.0.1:8080

Once you click `Start` the browser will send the audio and video from its
webcam to the server.

The server will play a pre-recorded audio clip and send the received video back
to the browser, optionally applying a transform to it.

In parallel to media streams, the browser sends a 'ping' message over the data
channel, and the server replies with 'pong'.


## Build

To build on x86 Linux Desktop with nVidia GPU

```bash
$ docker build -t edge-video .
```

## Run and test locally

To run and test

```bash
$ docker run -it --rm --gpus all -p 127.0.0.1:8080:8080 edge-video
```

Open [http://127.0.0.1:8080](http://127.0.0.1:8080) in a browser

## Reference

https://www.datamachines.io/blog/toward-a-containerized-nvidia-cuda-tensorflow-and-opencv
https://hub.docker.com/r/datamachines/cuda_tensorflow_opencv
https://github.com/datamachines/cuda_tensorflow_opencv/blob/master/README.md

https://opensource.com/article/19/1/gstreamer

- https://stackoverflow.com/questions/53187474/receive-webrtc-video-stream-using-python-opencv-in-real-time
- https://stackoverflow.com/questions/53187474/receive-webrtc-video-stream-using-python-opencv-in-real-time
- https://github.com/node-webrtc/node-webrtc
- http://www.linuxintro.org/wiki/Set_up_a_Webcam_with_Linux
- https://unix.stackexchange.com/questions/3304/how-do-i-watch-my-webcams-feed-in-linux
- https://www.mgraves.org/2018/09/how-to-using-an-rtsp-stream-as-a-source-for-a-webrtc-application/
- https://github.com/mpromonet/webrtc-streamer
- https://github.com/NVIDIA/nvidia-docker/wiki/NVIDIA-Container-Runtime-on-Jetson#supported-devices
- https://github.com/NVIDIA/libnvidia-container/blob/jetson/design/mount_plugins.md


