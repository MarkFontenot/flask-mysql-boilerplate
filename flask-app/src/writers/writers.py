from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


writers = Blueprint('writers', __name__)


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
    query = f'''
        INSERT INTO Quiz (status, category, numOffenses, url, writer_id, title, description)
        VALUES ("{status}", "{category}", {numOffenses}, "{url}", {writerId}, "{title}", "{description}")
    '''
    current_app.logger.info(query)

    # executing and committing the insert statement
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Success!'

# Creates a new question for a quiz
@writers.route('/quizzes/<int:quiz_id>', methods=['POST'])
def create_question(quiz_id):
    # collecting data from request object
    the_data = request.json
    current_app.logger.info(the_data)

    # extracting the vars
    type = the_data['type']
    questionText = the_data['questionText']
    responseOptions = the_data['responseOptions']

    # constructing the query
    query = f'''
        INSERT INTO Question (type, question_text, quiz_id)
        VALUES ("{type}", "{questionText}", {quiz_id});
    '''
    current_app.logger.info(query)

    # executing and committing the insert statement
    cursor = db.get_db().cursor()
    cursor.execute(query)
    question_id = cursor.lastrowid
    current_app.logger.info("New row id: " + str(question_id))

    create_response_options(question_id, responseOptions)

    db.get_db().commit()
    return 'Success!'

# Creates the given response options
def create_response_options(questionId, responseOptions):
    query = 'INSERT INTO ResponseOptions (question_id, option_text, correct) VALUES'
    optionList = []

    for option in responseOptions:
        optionText = option['optionText']
        correct = option['correct']
        optionList.append(f'({questionId}, "{optionText}", {correct})')

    options = ",".join(optionList)
    query += options
    current_app.logger.info(query)
    cursor = db.get_db().cursor()
    cursor.execute(query)

    return None
    
# Get statistics behind a particular quiz
@writers.route('/quizzes/<int:quiz_id>/results', methods=['GET'])
def get_quiz_results(quiz_id):
    query = f'''
        SELECT numTimesTaken, percentAbove80, statsLastUpdated
        FROM Quiz
        WHERE id = {quiz_id}
    '''
    return execute_cursor_with_response(query)

# TODO: If time, add a PUT route that actually updates the calculations -- might be out of scope for the deadline though

# Update an existing quiz to include or remove questions
# TODO

# Update an existing question's content or answer options
# TODO

# Update or delete a quiz
@writers.route('/quizzes/<int:quiz_id>/update', methods=['DELETE', 'PUT'])
def handle_quiz_update(quiz_id):
    if request.method == 'DELETE':
        delete_quiz(quiz_id)

    return {}

# Delete a quiz
def delete_quiz(quiz_id):
    query = f'''
        DELETE FROM Quiz
        WHERE id = {quiz_id};
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()


# View an existing quiz
# TODO

# View all quizzes belonging to a specific writer
