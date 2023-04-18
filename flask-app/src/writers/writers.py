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
# View quiz
@writers.route('/quizzes/<int:quiz_id>', methods=['POST', 'GET'])
def quizzes(quiz_id):
    if request.method == 'POST':
        return create_question(quiz_id)
    elif request.method == 'GET':
        return get_quiz(quiz_id)

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

# Get a quiz
def get_quiz(quiz_id):
    query = f'''
        SELECT * FROM Quiz
        WHERE id = {quiz_id}
    '''
    return execute_cursor_with_response(query)
    
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

# Update or delete a quiz
@writers.route('/quizzes/<int:quiz_id>/update', methods=['DELETE', 'PUT'])
def handle_quiz_update(quiz_id):
    if request.method == 'DELETE':
        delete_quiz(quiz_id)
        return {}
    elif request.method == 'PUT':
        return update_quiz(quiz_id)

# Delete a quiz
def delete_quiz(quiz_id):
    query = f'''
        DELETE FROM Quiz
        WHERE id = {quiz_id};
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

# Update quiz
def update_quiz(quiz_id):
    the_data = request.json

    query = '''
        UPDATE Quiz
        SET 
    '''

    updates = []

    # extracting the vars
    if ('status' in the_data):
        status = the_data['status'] 
        updates.append(f'status = "{status}"')
    
    if ('category' in the_data):
        category = the_data['category']
        updates.append(f'category = "{category}"')

    if ('numOffenses' in the_data):
        numOffenses = the_data['numOffenses']
        updates.append(f'numOffenses = {numOffenses}')

    if ('url' in the_data):
        url = the_data['url']
        updates.append(f'url = "{url}"')

    if ('writerId' in the_data):
        writerId = the_data['writerId']
        updates.append(f'writer_id = {writerId}')

    if ('title' in the_data):
        title = the_data['title']
        updates.append(f'title = "{title}"')

    if ('description' in the_data):
        description = the_data['description']
        updates.append(f'description = "{description}"')   

    query += ",".join(updates)
    query += f' WHERE id = {quiz_id};'

    current_app.logger.info(query)
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return "Success!"

# View questions for a quiz
@writers.route('/quizzes/<int:quiz_id>/questions', methods=['GET'])
def get_quiz_questions(quiz_id):
    query = f'''
        SELECT * FROM Question
        WHERE quiz_id = {quiz_id}
    '''
    return execute_cursor_with_response(query)


# Update an existing question's content
@writers.route('/questions/<int:question_id>', methods=['PUT', 'DELETE'])
def update_or_delete_question(question_id):
    if request.method == 'PUT':
        return update_question(question_id)
    elif request.method == 'DELETE':
        delete_question(question_id)
        return {}
    
def update_question(question_id):
    the_data = request.json

    query = '''
        UPDATE Question
        SET 
    '''

    updates = []

    # extracting the vars
    if ('type' in the_data):
        type = the_data['type'] 
        updates.append(f'type = "{type}"')
    
    if ('questionText' in the_data):
        questionText = the_data['questionText']
        updates.append(f'question_text = "{questionText}"')

    if ('quizId' in the_data):
        quizId = the_data['quizId']
        updates.append(f'quiz_id = {quizId}')

    query += ",".join(updates)
    query += f' WHERE id = {question_id};'

    current_app.logger.info(query)
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return "Success!"

def delete_question(question_id):
    query = f'''
        DELETE FROM Question
        WHERE id = {question_id};
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()


# Delete answer options
@writers.route('/questions/<int:question_id>/options/<option_text>', methods=['DELETE'])
def delete_option(question_id, option_text):
    query = f'''
        DELETE FROM ResponseOptions
        WHERE question_id = {question_id} AND option_text = "{option_text}";
    '''
    current_app.logger.info(query)
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    return {}
    

# View response options for a question
@writers.route('/questions/<int:question_id>/options', methods=['GET'])
def get_response_options(question_id):
    query = f'''
        SELECT * FROM ResponseOptions
        WHERE question_id = {question_id}
    '''
    return execute_cursor_with_response(query)


# View all quizzes belonging to a specific writer
@writers.route('/writers/<int:writer_id>/quizzes', methods=['GET'])
def get_writer_quizzes(writer_id):
    query = f'''
        SELECT *
        FROM Quiz
        WHERE writer_id = {writer_id}
    '''
    return execute_cursor_with_response(query)
