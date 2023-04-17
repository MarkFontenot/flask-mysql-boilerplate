from flask import Blueprint, request, jsonify, make_response
from src import db

thoughts = Blueprint('thoughts', __name__)

@thoughts.route('/thoughts', methods=['GET'])
def get_feed():
    pass

@thoughts.route('/thoughts', methods=['POST'])
def post_thought():
    pass

@thoughts.route('/thoughts/<thought_id>', methods=['GET'])
def get_thought():
    pass

@thoughts.route('/thoughts/<thought_id>', methods=['PUT'])
def update_thought():
    pass

@thoughts.route('/thoughts/<thought_id>', methods=['DELETE'])
def delete_thought():
    pass

@thoughts.route('/thoughts/<thought_id>/comments', methods=['GET'])
def get_thought_comments():
    pass

@thoughts.route('/thoughts/<thought_id>/comments', methods=['POST'])
def post_comment():
    pass