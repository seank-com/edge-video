FROM nvcr.io/nvidia/l4t-tensorflow:r32.4.3-tf1.15-py3

WORKDIR /root

RUN pip3 install pillow

COPY labels.txt /root/labels.txt
COPY model.pb /root/model.pb
COPY object_detection.py /root/object_detection.py
COPY predict.py /root/predict.py
COPY pen.jpg /root/pen.jpg
