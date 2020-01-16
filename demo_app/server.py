from flask import Flask, render_template
from prometheus_flask_exporter.multiprocess import GunicornInternalPrometheusMetrics
import os

application = Flask(__name__, static_folder="./public", template_folder="./templates")
metrics = GunicornInternalPrometheusMetrics(application)

application.config['APPLICATION_ROOT'] = os.environ.get('APPLICATION_ROOT', '/')

@application.route("/")
def index():
    return render_template("index.html")


@application.route("/click-button", methods=["POST"])
@metrics.counter("demo_app_button_clicks", "Number of button presses by user")
def web_button():
    return {}
