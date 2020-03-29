# ----------------------------------------------------------------------------------------------------------------------
# Author: Jordan K Bartos
# Date: March 27, 2020
# Description: jumping off point for ComplimentorBot functionality
# ----------------------------------------------------------------------------------------------------------------------


import json
import requests
import os
import time
from flask import Flask, request, jsonify, make_response, Response
import slack
import re
import random
import sys
import hmac
import hashlib
import base64
import sys
    

# connect to the database and get signing secret
sys.path.append('/var/www/complimentor-bot-v2/ComplimentorBot')
sys.path.append('./dbcon')
from .dbcon import compliment_db, signing_secret, bot_token


app = Flask(__name__)


def generate_compliment():
    # initialize
    roots = []
    cur = compliment_db.cursor()
    res = "You're "

    # get an adverb and corresponding article
    cur.execute('SELECT w.word, w2.word, w.root_word FROM words w '
                    'INNER JOIN parts_of_speech pos ON w.part_of_speech = pos.pos_id '
                    'INNER JOIN words w2 ON w.article = w2.word_id '
                    'WHERE pos.name = "adverb" ORDER BY RAND() LIMIT 1;')
    query_response = cur.fetchall()[0]
    article = query_response[1]
    adverb = query_response[0]
    roots.append(query_response[2])

    # get an adjective that doesn't have the same root as the adverb
    query = 'SELECT w.word, w.root_word FROM words w '\
                'INNER JOIN parts_of_speech pos ON w.part_of_speech = pos.pos_id '\
                'WHERE pos.name = "adjective" AND w.root_word != '
    query += '"' + roots[0] + '" '
    query += 'ORDER BY RAND() LIMIT 1;'
    cur.execute(query)
    query_response = cur.fetchall()[0]
    adjective = query_response[0]
    roots.append(query_response[1])
        
    # get a noun that doesn't have the same root as previous two
    query = 'SELECT w.word FROM words w INNER JOIN parts_of_speech pos ON w.part_of_speech = pos.pos_id WHERE pos.name = "noun" AND w.root_word != '
    query += '"' + roots[0] + '" AND w.root_word != "' + roots[1] + '" '
    query += 'ORDER BY RAND() LIMIT 1;'
    cur.execute(query)
    query_response = cur.fetchall()[0]
    noun = query_response[0]

    return ' '.join([article, adverb, adjective, noun])
        

# https://www.jokecamp.com/blog/examples-of-creating-base64-hashes-using-hmac-sha256-in-different-languages/#python3
def verify_signature(req_encoded, signing_secret, req_signature):
    req_hash = 'v0=' + hmac.new(
        str.encode(signing_secret),
        req_encoded,
        hashlib.sha256
        ).hexdigest()
    if hmac.compare_digest(req_hash, req_signature):
        return True
    return False


def authenticate(request):
    request_body = request.get_data()
    request_headers = request.headers
    time_stamp = request_headers['X-Slack-Request-Timestamp']

    # ignore anything from more than 5 minues ago per Slack recommendations
    if abs(time.time() - int(time_stamp)) > 60 * 5:
        return
    req_encoded = str.encode('v0:' + time_stamp + ':') + request_body
    req_signature = request_headers.get('X-Slack-Signature')

    return verify_signature(req_encoded, signing_secret, req_signature)


def make_error(err_no, err_msg):
    return {'code': str(err_no), 'status': 'failure', 'err_msg': err_msg}


@app.route('/', methods=['POST'])
def url_verify():
    if authenticate(request):
        res = {'code': '200', 'status': 'success', 'challenge': request.get_json()['challenge']}
    else:
        res = make_error('401', 'invalid_signature')
    return make_response(res)


@app.route('/compliment-myself', methods=['POST'])
def compliment_myself():
    if authenticate(request):
        request_data = request.form
        compliment = request_data['user_name'] + ' is ' + generate_compliment()
        return make_response({'text': compliment, 'response_type': 'in_channel'}, 200)
    else:
        return make_response('invalid_workspace', 401)


@app.route('/compliment-someone', methods=['POST'])
def compliment_someone():
    # get a list of users on the team
    if authenticate(request):
        payload = {'token': bot_token}
        res = requests.post('https://slack.com/api/users.list', data=payload)
        members = json.loads(res.content.decode('utf-8')).get('members', None)
        if members:
            member_names = []
            for member in members:
                if member['is_bot'] == False:
                    if member['profile']['display_name'] != '':
                        member_names.append(member['profile']['display_name'])
                    elif member['profile']['real_name'] != '':
                        member_names.append(member['profile']['real_name'])
                    else:
                        member_names.append(member['name'])
            index = random.randint(0, len(member_names) -1)
            chosen_member = member_names[index]
            compliment = chosen_member + ' is ' + generate_compliment()
            return make_response({'text': compliment, 'response_type': 'in_channel'}, 200)
        else:
            return make_response('read_members_error', 403)
    else:
        return make_response('invalid_workspace', 401)


if __name__ == "__main__":
    app.run()
