# Live Video from USB Camera to RTSP
This document shows how to stream USB camera feed over RTSP for host devices running Unix (a requirement for LVA). 

The solution runs as a Docker container image named **usb-to-rtsp**. While running the container image, one must map the USB camera on the host device to the container by using the following Docker command parameters: `sudo docker run --device=/dev/video0  ...` 

Before running the container image, the host device must have the USB camera installed properly and operating. On the host device, check that the following file exists: **/dev/video0**.  

If there exist more than one USB camera installed on the host device, these devices will be named as **/dev/video0**, **/dev/video1**, etc.  

## Building the Container Image
Run the following command in the solution folder, **... live-video-analytics/utilities/usb-to-rtsp**.

```bash
sudo docker build . -t usb-to-rtsp:v1
```

## Running the Container
The default stream port of the solution is 8554. With the below command, we are mapping the RTSP stream coming from container to port 554 of the host device.

```bash
sudo docker run --device=/dev/video0 --env VIDEO_PIPELINE="v4l2src device=/dev/video0 ! video/x-raw,format=YUY2,width=640,height=480 ! videoscale ! videoconvert ! video/x-raw,format=I420 ! x264enc tune=zerolatency ! rtph264pay name=pay0" -p 8554:8554 -it --rm usb-to-rtsp:v1  
```

If `--env VIDEO_PIPELINE` is not specified, the solution will use the following video pipeline: 

```
v4l2src device=/dev/video0 ! videoconvert ! videoscale! video/x-raw ! x264enc tune=zerolatency ! rtph264pay name=pay0
```

The default pipeline encodes the USB camera stream in H264 format, which is supported by LVA. 

## Playback USB Camera Stream Over RTSP
Out of many options, we are using VLC player to play the USB camera stream.

On the VLC menu, click on the following:

```
Media --> Open Network Stream
```

Enter the following address:

```
rtsp://127.0.0.1:8554/stream1
```

The live USB camera stream will start playing on VLC.

## Stop and Remove the Container
If you are finished with the stream, stop the Docker container by pressing ctrl-c in the interactive terminal

