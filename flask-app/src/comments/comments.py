from flask import Blueprint, request, jsonify, make_response
from src import db

comments = Blueprint('comments', __name__)

@comments.route('/comments/<comment_id>', methods=['GET'])
def get_comment():
    pass

@comments.route('/comments/<comment_id>', methods=['PUT'])
def update_comment():
    pass

@comments.route('/comments/<comment_id>', methods=['DELETE'])
def delete_comment():
    pass