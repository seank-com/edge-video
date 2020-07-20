from PIL import Image
import tensorflow as tf
import os
import numpy as np
import cv2

# Load from a file
graph_def = tf.compat.v1.GraphDef()
labels = []

