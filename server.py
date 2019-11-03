import os

from flask import Flask, render_template, jsonify, request

import emojionz

app = Flask(__name__)
base_dir = os.path.join(app.static_folder, 'assets')
output_dir = os.path.join(app.static_folder, 'output')
categories = ["eyes", "hands", "head", "mouth"]


@app.route('/')
def server():
    return render_template('index.html')


@app.route('/api/list/')
def list_emojis():

    images = {}
    for category in categories:
        files = os.listdir(os.path.join(base_dir, category))
        images[category] = files
    return jsonify(images)


@app.route('/api/composite/', methods=['POST'])
def composite():
    if request.method == 'POST':
        selected_features = request.json

        emojionz.init(base_dir, output_dir)
        output_image = emojionz.initialize_emoji_base()
        for category in categories:
            if not selected_features.get(category):
                continue

            selected_feature_filename = selected_features[category].split("/")[-1]
            output_image = emojionz.add_feature(output_image, category, selected_feature_filename)

        output_image_filename = emojionz.write_output_image(output_image)

        return jsonify({"url": output_image_filename})
    return jsonify({})
