from flask import Blueprint, request, jsonify, make_response
import json
from src import db


users = Blueprint('users', __name__)

# Helper function to execute DB cursor, for use when DB does not need to be changed
def execute_cursor_with_response(sql_query):
    cursor = db.get_db().cursor()
    cursor.execute(sql_query)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get a list of all available quizzes by their title
@users.route('/quizzes/all', methods=['GET'])
def get_all_quizzes():
    query = f'''
        SELECT title
        FROM Quiz
        WHEN status = 'active'
        '''
    return execute_cursor_with_response(query)