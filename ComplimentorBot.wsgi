#!/usr/bin/python3

import logging
import sys
logging.basicConfig(stream=sys.stderr)
sys.path.insert(0, 'home/ec2-user/complementor-bot-v2/')
from ComplemintorBot import app as application
application.secret_key = 'asdlWWXueweEJAdlkasjflakjdfeinaMY2388H4lkadf'
