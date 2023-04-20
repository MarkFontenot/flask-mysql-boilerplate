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
    query = '''
        SELECT title
        FROM Quiz
        WHERE status = 'active'
        '''
    return execute_cursor_with_response(query)

# Get a particular available quiz with its writer and associated questions
@users.route('/quizzes/<int:quiz_id>', methods=['GET'])
def get_quiz(quiz_id):
    query = f'''
        SELECT title, username, question_text
        FROM Quiz JOIN Writer ON Quiz.writer_id = Writer.id 
             JOIN Question ON Quiz.id = Question.quiz_id
        WHERE quiz_id = {quiz_id}
    '''
    return execute_cursor_with_response(query)

# Get whether or not the user got the given question correct
@users.route('/quizzes/<int:question_id>/<int:user_id>/score', methods=['GET'])
def get_score(question_id, user_id):
    query = f'''
        SELECT correct
        FROM ResponseOptions JOIN Response ON ResponseOptions.question_id = Response.question_id
             JOIN Question ON Question.id = Response.question_id
        WHERE ResponseOptions.question_id = {question_id}
                AND Response.user_id = {user_id}
    '''
    return execute_cursor_with_response(query)

# Get a list of all quizzes that have been taken before
@users.route('/history', methods=['GET'])
def get_history():
    query = f'''
        SELECT title
        FROM Quiz JOIN User
        WHERE numTimesTaken > 0
    '''
    return execute_cursor_with_response(query)

# Get the link to a particular quiz
@users.route('/quizzes/<int:quiz_id>', methods=['GET'])
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
    LName = the_data['LName']
    numOffenses = the_data['numOffenses']
    email = the_data['email']

    # constructing the query
    query = f'''
        INSERT INTO User (id, username, FName, LName, numOffenses, email)
        VALUES ("{id}", "{username}", "{FName}", "{LName}", "{numOffenses}", "{email}")
    '''

    current_app.logger.info(query)

    # executing and committing the insert statement
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Success!'


# Deletes a particular user account
@users.route('/users/<int:user_id>/delete', methods=['DELETE'])
def delete_user(user_id):
    query = f'''
        DELETE FROM User
        WHERE id = {user_id};
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    return {}
    

# Updates the username of a particular user
@users.route('/users/<int:user_id>/<int:new_name>/update', methods=['PUT'])
def update_user(user_id, new_name):
    query = f'''
        UPDATE User
        SET
            username = {new_name}
        WHERE id = {user_id}
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Success!'

# TODO all tests for these routes