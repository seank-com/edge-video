FROM nvcr.io/nvidia/l4t-tensorflow:r32.4.3-tf1.15-py3

WORKDIR /root

RUN pip3 install pillow

COPY test.py /root/test.py

