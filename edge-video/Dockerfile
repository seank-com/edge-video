#FROM ubuntu:20.04
FROM datamachines/cudnn_tensorflow_opencv:10.2_1.15.3_4.3.0-20200615

#RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

#RUN apt update && \
#  apt install -y python3 python3-pip libglib2.0-bin

#RUN pip3 install aiohttp aiortc opencv-python-headless
RUN pip3 install aiohttp aiortc

WORKDIR /

COPY app app/

# Expose the port
EXPOSE 8080

# Set the working directory
WORKDIR /app

# Run the flask server for the endpoints
CMD python3 server.py