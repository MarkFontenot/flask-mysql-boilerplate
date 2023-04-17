from flask import Blueprint, request, jsonify, make_response
from src import db

analytics = Blueprint('analytics', __name__)

@analytics.route('/analytics', methods='GET')
def get_user_analytics():
    pass

@analytics.route('/analytics/<thought_id>', methods='GET')
def get_thought_analytics():
    pass

@analytics.route('/analytics/<user_id>/following', methods='GET')
def get_following():
    pass

@analytics.route('/analytics/<user_id>/following', methods='POST')
def follow_user():
    pass

@analytics.route('/analytics/<user_id>/followers', methods='GET')
def get_followers():
    pass