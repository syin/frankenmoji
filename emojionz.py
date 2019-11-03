#!/usr/bin/env python
import os
import uuid

from PIL import Image

base_dir = None
output_dir = None


def init(app_base_dir, app_output_dir):
    global base_dir
    global output_dir
    base_dir = app_base_dir
    output_dir = app_output_dir


def initialize_emoji_base():
    canvas_width = 160
    canvas_height = 160
    output_image = Image.new('RGBA', (canvas_width, canvas_height))
    base_face = Image.open(os.path.join(base_dir, 'base.png'))
    base_face = base_face.convert('RGBA')
    output_image = Image.alpha_composite(output_image, base_face)
    return output_image


def add_feature(base_image, category, selected_feature):
    selected_feature_image = Image.open(os.path.join(base_dir, category, selected_feature))
    selected_feature_image = selected_feature_image.convert('RGBA')
    output_image = Image.alpha_composite(base_image, selected_feature_image)
    return output_image


def write_output_image(output_image):
    out_filename = "emojionz-{uuid}.png".format(uuid=uuid.uuid4().hex)
    out_path = os.path.join(output_dir, out_filename)
    output_image.save(out_path, optimize=True)
    return out_filename
