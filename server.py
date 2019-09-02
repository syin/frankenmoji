import json
import os

from flask import Flask, render_template, jsonify

# import cowboyz

app = Flask(__name__)


@app.route('/')
def server():
    return render_template('index.html')


@app.route('/api/list/')
def list_emojis():
    base_dir = os.path.join(app.static_folder, 'assets')
    categories = ["eyes", "hands", "head", "mouth"]

    images = {}
    for category in categories:
        files = os.listdir(os.path.join(base_dir, category))
        images[category] = files
    print(images)
    return jsonify(images)


# @app.route('/api/cowboize/<emoji_name>')
# def cowboize(emoji_name):
#     if cowboyz.cowboize(emoji_name):
#         return jsonify({'name': emoji_name})
