from flask import Blueprint, request, jsonify, make_response, current_app
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
# TODO unsure if this is written correctly
@users.route('/quizzes/<int:quiz_id/score', methods=['GET'])
def get_score(quiz_id, user_id):
    query = f'''
        SELECT count(question_id) as correct
        FROM Response JOIN ResponseOptions ON (question_id)
        WHERE ResponseOptions.correct = true
              AND user_id = {user_id}
              AND quiz_id = {quiz_id}

        SELECT ROUND(correct / count(response.selection), 1) AS score
        FROM correct JOIN Response
        WHERE user_id = {user_id}
              AND quiz_id = {quiz_id}
    '''
    return execute_cursor_with_response(query)

# Get a list of all quizzes the user has taken before
@users.route('/users/<int:user_id/history', methods=['GET'])
def get_history(user_id):
    query = f'''
        SELECT title
        FROM Quiz JOIN User
        WHERE numTimesTaken > 0
    '''
    return execute_cursor_with_response(query)

# Get the link to a particular quiz
@users.route('/quizzes/<int:quiz_id', methods=['GET'])
def get_link(quiz_id):
    query = f'''
        SELECT URL
        FROM Quiz
        WHERE id = {quiz_id}
    '''
    return execute_cursor_with_response(query)

# Creates a new user account
@users.route('/users', methods=['POST'])
def create_account():

    # collecting data from request object
    the_data = request.json
    current_app.logger.info(the_data)

    # extracting the vars
    id = the_data['id']
    username = the_data['username']
    FName = the_data['FName']
    LName = the_data['yearsActive']
    yearsActive = the_data['yearsActive']
    numOffenses = the_data['numOffenses']

    # constructing the query
    query = f'''
        INSERT INTO User (id, username, FName, LName, yearsActive, numOffenses)
        VALUES ("{id}", "{username}", "{FName}", "{LName}", "{yearsActive}", "{numOffenses}")
    '''

    current_app.logger.info(query)

    # executing and committing the insert statement
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Success!'


# Deletes a particular user account
@users.route('/users/<int:user_id/delete', methods=['DELETE'])
def delete_user(user_id):
    query = f'''
        DELETE FROM User
        WHERE id = {user_id};
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

# Updates the username of a particular user
@users.route('/users/<int:user_id/update', methods=['PUT'])
def update_usert(user_id, new_name):
    query = f'''
        UPDATE Users
        SET
            username = {new_name}
        WHERE id = {user_id}
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

# TODO all tests for these routes