# Custom Vision Dockerfile

Exported from customvision.ai.

## Build and Run (locally)

### On x86 Linux Desktop with nVidia GPU

```bash
$ docker build -f Dockerfile.x86 -t image-predict .
$ docker run --gpus all -p 127.0.0.1:80:80 -d image-predict
```

### On arm64 Jetson Nano

```bash
$ sudo cp opencv.csv /etc/nvidia-container-runtime/host-files-for-container.d/opencv.csv
$ sudo chmod 644 /etc/nvidia-container-runtime/host-files-for-container.d/opencv.csv
$ sudo docker build -f Dockerfile.nano -t image-predict .
$ sudo docker run -it --rm --runtime nvidia --network host image-predict
```

## Test

```bash
$ curl -v -X POST http://127.0.0.1/image -H "Content-Type:application/octet-stream" --data-binary @pen.jpg
```

or 

```bash
$ curl -v -X POST http://127.0.0.1/image -F imageData=@pen.jpg
```

## Setup Jetson Nano

1. Configure Jetson Nano
    1. Acquire JetsonNano, 5V-4A Barrel Jack, cooling fan
    1. Install [JetPack 4.4](https://developer.nvidia.com/embedded/jetpack#install)

1. Install IoTEdge (from [Docs](https://docs.microsoft.com/en-us/azure/iot-edge/how-to-install-iot-edge-linux))
    ```bash
    $ wget -O microsoft-prod.list https://packages.microsoft.com/config/ubuntu/18.04/multiarch/prod.list
    $ sudo cp ./microsoft-prod.list /etc/apt/sources.list.d/
    $ wget -O microsoft.asc https://packages.microsoft.com/keys/microsoft.asc
    $ cat microsoft.asc | gpg --dearmor > microsoft.gpg
    $ sudo cp ./microsoft.gpg /etc/apt/trusted.gpg.d/
    $ sudo apt-get update
    $ sudo apt-get install iotedge
    ```
1. [Use SSH from your development machine](https://code.visualstudio.com/docs/remote/ssh-tutorial)

1. Configure IoTEdge (from [Docs](https://docs.microsoft.com/en-us/azure/iot-edge/how-to-install-iot-edge-linux#option-1-manual-provisioning) with [troubleshooting](https://docs.microsoft.com/en-us/azure/iot-edge/troubleshoot-common-errors#edge-agent-module-reports-empty-config-file-and-no-modules-start-on-the-device)) TBD

Useful Commands

```bash
$ head -n 1 /etc/nv_tegra_release
```

## Reference

- Jetson plugin [documentation](https://github.com/NVIDIA/libnvidia-container/blob/jetson/design/mount_plugins.md) and [forum post](https://forums.developer.nvidia.com/t/docker-image-with-python-support-for-opencv-tensorrt-and-pycuda/79775/9)
- [Azure sample](https://github.com/Azure-Samples/NVIDIA-Deepstream-Azure-IoT-Edge-on-a-NVIDIA-Jetson-Nano)
- [Installing VS Code](https://www.youtube.com/watch?v=2sHQBTtDz6c) on a Jetson Nano
- [Jetson Zoo](https://elinux.org/Jetson_Zoo#TensorFlow)
- [Jetson Containers](https://github.com/idavis/jetson-containers)
- [nVidia GPU Cloud](https://ngc.nvidia.com/catalog/containers)
- [Exporting a CustomVision Model](https://docs.microsoft.com/en-us/azure/cognitive-services/custom-vision-service/export-model-python)


## Further Reading
- [Resizing with OpenCV](https://docs.microsoft.com/en-us/azure/cognitive-services/custom-vision-service/export-model-python)
- Configure access to [local camera on Jetson](https://github.com/NVIDIA/nvidia-docker/wiki/NVIDIA-Container-Runtime-on-Jetson#supported-devices) even [RealSense](https://github.com/JetsonHacksNano/installLibrealsense)

## building opencv on nVidia (from the [community](https://github.com/mdegans/nano_build_opencv/blob/master/build_opencv.sh))

```bash
$ cd /tmp
$ mkdir build_opencv
$ cd build_opencv
$ apt-get update
$ apt-get dist-upgrade -y --autoremove
$ apt-get install -y build-essential cmake git gfortran libatlas-base-dev libavcodec-dev libavformat-dev libavresample-dev libcanberra-gtk3-module libdc1394-22-dev libeigen3-dev libglew-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer1.0-dev libgtk-3-dev libjpeg-dev libjpeg8-dev libjpeg-turbo8-dev liblapack-dev liblapacke-dev libopenblas-dev libpng-dev libpostproc-dev libswscale-dev libtbb-dev libtbb2 libtesseract-dev libtiff-dev libv4l-dev libxine2-dev libxvidcore-dev libx264-dev pkg-config python-dev python-numpy python3-dev python3-numpy python3-matplotlib qv4l2 v4l-utils v4l2ucp zlib1g-dev
$ git clone --depth 1 --branch "4.1.1" https://github.com/opencv/opencv.git
$ git clone --depth 1 --branch "4.1.1" https://github.com/opencv/opencv_contrib.git
$ cd opencv
$ mkdir build
$ cd build
$ cmake -D BUILD_EXAMPLES=OFF -D BUILD_opencv_python2=ON -D BUILD_opencv_python3=ON -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D CUDA_ARCH_BIN=5.3,6.2,7.2 -D CUDA_ARCH_PTX= -D CUDA_FAST_MATH=ON -D CUDNN_VERSION='8.0' -D EIGEN_INCLUDE_PATH=/usr/include/eigen3 -D ENABLE_NEON=ON -D OPENCV_DNN_CUDA=ON -D OPENCV_ENABLE_NONFREE=ON -D OPENCV_EXTRA_MODULES_PATH=/tmp/build_opencv/opencv_contrib/modules -D OPENCV_GENERATE_PKGCONFIG=ON -D WITH_CUBLAS=ON -D WITH_CUDA=ON -D WITH_CUDNN=ON -D WITH_GSTREAMER=ON -D WITH_LIBV4L=ON -D WITH_OPENGL=ON .. 2>&1 | tee -a config.log
$ make -j1 2>&1 | tee -a build.log
```



apt update
apt install libffi-dev libavdevice-dev libavfilter-dev libopus-dev libvpx-dev libsrtp2-dev python-openssl pkg-config git
git clone --depth 1 https://github.com/aiortc/aiortc.git
cd aiortc/
python3 setup.py bdist_wheel

dist/aiortc-0.9.28-cp36-cp36m-linux_aarch64.whl
