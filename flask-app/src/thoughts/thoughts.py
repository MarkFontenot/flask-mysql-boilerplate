from flask import Blueprint, request, Response, jsonify, make_response
from src import db
import datetime
from src.utils import execute_sql, sql_to_json

thoughts = Blueprint('thoughts', __name__)

@thoughts.route('/thoughts', methods=['GET'])
def get_feed() -> Response:
    query = f'''
    SELECT * FROM Thought
    '''
    return sql_to_json(execute_sql(query))

@thoughts.route('/thoughts', methods=['POST'])
def post_thought() -> Response:
    try:
        data = request.get_json()
        thought_content = data['content']        
        userID = data['userID']

        thought = f'''
            INSERT INTO Thought (Content, UserID)
            VALUES ("{thought_content}",{userID});
        '''

        execute_sql(thought)
        return "Success", 200
    except: 
        return "Could not post thought", 400
    
    # show_create = f'''
    #     SELECT * FROM Thought WHERE ThoughtID = LAST_INSERT_ID();
    # '''
    # return sql_to_json(execute_sql(show_create))

@thoughts.route('/thoughts/<int:thought_id>', methods=['GET'])
def get_thought(thought_id : int) -> Response:
    query = f'''
    SELECT * FROM Thought 
    Where ThoughtID = "{thought_id}"
    '''
    return sql_to_json(execute_sql(query))

@thoughts.route('/thoughts/<thought_id>', methods=['PUT'])
def update_thought(thought_id : int) -> Response:
    try:
        data = request.get_json()
        thought_updated_content = data['content']        

        thought = f'''
            Update Thought
            set Content = "{thought_updated_content}"
            where ThoughtID = {thought_id}
        '''

        execute_sql(thought)

        return "Success", 200
    except: 
        return "Could not update thought", 400
    
    # show_create = f'''
    #     SELECT * FROM Thought WHERE ThoughtID = {thought_id}
    # '''
    # return sql_to_json(execute_sql(show_create))
    
@thoughts.route('/thoughts/<thought_id>', methods=['DELETE'])
def delete_thought(thought_id : int) -> Response:
    try:
        delete_thought = f'''
            DELETE FROM Thought
            WHERE ThoughtID = {thought_id}
        
        '''
        
        execute_sql(delete_thought)

        return "Success", 200
    except: 
        return "Could not delete thought", 400

@thoughts.route('/thoughts/<thought_id>/comments', methods=['GET'])
def get_thought_comments(thought_id):
    query = f'''
    SELECT * FROM 
    Thought t join 
    ThoughtComments tc 
    on t.ThoughtID = tc.ThoughtID
    where t.ThoughtID = "{thought_id}"
    '''
    return sql_to_json(execute_sql(query))

@thoughts.route('/thoughts/<thought_id>/comments', methods=['POST'])
def post_comment(thought_id):
    try:
        data = request.get_json()
        comment_content = data['content']        
        userID = data['userID']

        thought = f'''
            INSERT INTO ThoughtComments (Content, UserID, ThoughtID)
            VALUES ("{comment_content}",{userID},{thought_id});
        '''

        execute_sql(thought)

        return "Success", 200
    except: 
        return "Could not post comment", 400
    
    # show_create = f'''
    #     SELECT * FROM Thought WHERE ThoughtID = LAST_INSERT_ID();
    # '''
    # return sql_to_json(execute_sql(show_create))