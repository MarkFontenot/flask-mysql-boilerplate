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

# Get a particular available quiz with its writer and associated questions
@users.route('/quizzes/<int:quiz_id>', methods=['GET'])
def get_quiz(quiz_id):
    query = f'''
        SELECT title, username, question_text
        FROM Quiz JOIN Writer ON Quiz.writer_id = Writer.id 
             JOIN Question ON Quiz.id = Question.quiz_id
    '''
    return execute_cursor_with_response(query)

# Get the user's final score on a particular quiz
# TODO how to calculate score?
# TODO should we remove this feature?
@users.route('/quizzes/<int:quiz_id/score', methods=['GET'])
def get_score(quiz_id):
    query = f'''

    '''
    return execute_cursor_with_response(query)

# Get a list of all quizzes the user has taken before
# TODO unsure if this implementation is correct
@users.route('/quizzes/<int:quiz_id/history', methods=['GET'])
def get_history(user_id):
    query = f'''
        SELECT title
        FROM Quiz JOIN User
        WHERE numTimesTaken > 0
    '''
    return execute_cursor_with_response(query)

# Get the link to a particular quiz

# Creates a new user account

# Deletes a particular user account