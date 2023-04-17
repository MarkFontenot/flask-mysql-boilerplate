from flask import Blueprint, request, jsonify, make_response
import json
from src import db, app as current_app


writers = Blueprint('writers', __name__)

# Helper function to execute DB cursor, for use when DB needs to be changed
def execute_cursor(sql_query):
    cursor = db.get_db().cursor()
    cursor.execute(sql_query)
    db.get_db().commit()

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

# Get all writers
@writers.route('/writers', methods=['GET'])
def get_writers():
    query = '''
        SELECT id, username, FName, LName, yearsActive
        FROM Writer
    '''
    return execute_cursor_with_response(query)

# Creates a new quiz
@writers.route('/quizzes', methods=['POST'])
def create_quiz():
    # collecting data from request object
    the_data = request.json
    current_app.logger.info(the_data)

    # extracting the vars
    status = the_data['status']
    category = the_data['category']
    numOffenses = the_data['numOffenses']
    url = the_data['url']
    writerId = the_data['writerId']
    title = the_data['title']
    description = the_data['description']

    # constructing the query
    query = '''
        INSERT INTO Quiz (status, category, numOffenses, url, writerId, title, description)
        VALUES (#{status}, #{category}, #{numOffenses}, #{url}, #{writerId}, #{title}, #{description})
    '''
    current_app.logger.info(query)

    # executing and committing the insert statement
    execute_cursor(query)

    return 'Success!'

# Creates a new question for a quiz
# TODO

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



