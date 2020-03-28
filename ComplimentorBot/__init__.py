# ----------------------------------------------------------------------------------------------------------------------
# Author: Jordan K Bartos
# Date: March 27, 2020
# Description: jumping off point for ComplimentorBot functionality
# ----------------------------------------------------------------------------------------------------------------------

import os
import time
from flask import Flask, request
import slack
import re
import random
import sys

# connect to the database
sys.path.append('/var/www/complimentor-bot-v2/ComplimentorBot')
sys.path.append('./dbcon')
from .dbcon import compliment_db

app = Flask(__name__)


@app.route('/')
def hello_world():
    print("hello world")
    return 'Hello, World'


@app.route('/event-subscribe', methods=['POST'])
def respond():
    return 'nothing yet'


if __name__ == "__main__":
    app.run()