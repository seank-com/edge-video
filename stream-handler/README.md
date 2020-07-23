# WebRTC Dockerfile



## Build

To build on x86 Linux Desktop with nVidia GPU

```bash
$ docker build -f Dockerfile -t stream-handler .
```

## Run and test locally

To run and test

```bash
$ docker run --gpus all -p 127.0.0.1:80:80 -d stream-handler
```

## Reference

- https://stackoverflow.com/questions/53187474/receive-webrtc-video-stream-using-python-opencv-in-real-time
- https://stackoverflow.com/questions/53187474/receive-webrtc-video-stream-using-python-opencv-in-real-time
- https://github.com/node-webrtc/node-webrtc
- http://www.linuxintro.org/wiki/Set_up_a_Webcam_with_Linux
- https://unix.stackexchange.com/questions/3304/how-do-i-watch-my-webcams-feed-in-linux
- https://www.mgraves.org/2018/09/how-to-using-an-rtsp-stream-as-a-source-for-a-webrtc-application/
- https://github.com/mpromonet/webrtc-streamer
- https://github.com/NVIDIA/nvidia-docker/wiki/NVIDIA-Container-Runtime-on-Jetson#supported-devices
- https://github.com/NVIDIA/libnvidia-container/blob/jetson/design/mount_plugins.md


