from flask import Blueprint, request, jsonify, make_response
import json
from src import db


writers = Blueprint('writers', __name__)

def execute_cursor(sql_query):
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

# Get all writers
@writers.route('/writers', methods=['GET'])
def get_writers():
    query = '''
        SELECT id, username, FName, LName, yearsActive
        FROM Writer
    '''
    return execute_cursor(query)

# Create a quiz and its associated questions
@writers.route('/quizzes', methods=['POST'])
def create_quiz():
    # TODO
    return nil

# Get statistics behind a particular quiz
# TODO

# Update an existing quiz to include or remove questions
# TODO

# Update an existing question's content or answer options
# TODO

# Delete a quiz
# TODO

# View an existing quiz
# TODO

# View all quizzes belonging to a specific writer



