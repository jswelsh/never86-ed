#!/usr/bin/env python3
from __future__ import print_function
import os
import sys
import argparse
from pathlib import Path
import numpy as np
from PIL import Image, ImageOps

from keras.preprocessing.image import img_to_array
from keras.applications import ResNet50
from keras.layers import Input
from keras.models import Model, load_model, model_from_json
import json


BASE_DIR = Path(__file__).parent
TRAIN_PATH=Path(BASE_DIR, 'train')

MODEL_PATH = Path(BASE_DIR, 'model.h5')
MODEL = load_model(str(MODEL_PATH))

def main(arguments):
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('infile', help="Input File (Image)", type=argparse.FileType('rb'))
    parser.add_argument('-o', '--outfile', help="Output File (JSON)",
                        default=sys.stdout, type=argparse.FileType('w'))

    args = parser.parse_args(arguments)
    return detect_image(args.infile, args.outfile)

def detect_image(infile, outfile):
    im = Image.open(infile)
    im = ImageOps.fit(im, (200, 200))
    image_data = img_to_array(im)
    image_data = np.full((1, 200, 200, 3), image_data)
    prediction = MODEL.predict(image_data)
    outfile.write(json.dumps(prediction[0].tolist()))

if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
