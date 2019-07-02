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
    filename = os.path.join(app.static_folder, 'assets', 'available_emojis.json')
    f = open(filename, 'r')
    emojis = json.load(f)
    return jsonify(emojis)


# @app.route('/api/cowboize/<emoji_name>')
# def cowboize(emoji_name):
#     if cowboyz.cowboize(emoji_name):
#         return jsonify({'name': emoji_name})
