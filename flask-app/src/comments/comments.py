from flask import Blueprint, request, Response
from src.utils import execute_sql, sql_to_json

comments = Blueprint('comments', __name__)

# Gets a comment with the given CommentID
@comments.route('/<int:comment_id>', methods=['GET'])
def get_comment(comment_id: int) -> Response:
    query = f'''
    SELECT * FROM ThoughtComments
    WHERE CommentID = {comment_id};
    '''
    return sql_to_json(execute_sql(query))


# Updates a comment with the given CommentID
@comments.route('/<int:comment_id>', methods=['PUT'])
def update_comment(comment_id: int) -> Response:
    try:
        statement = f'''
        UPDATE ThoughtComments
        SET Content = "{request.form['content']}"
        WHERE CommentID = {comment_id}
        '''
        execute_sql(statement)
        return "Success", 200
    except: 
        return "Could not update comment", 400


# Deletes a comment with the given CommentID
@comments.route('/<int:comment_id>', methods=['DELETE'])
def delete_comment(comment_id: int):
    try:
        statement = f'''
        DELETE FROM ThoughtComments
        WHERE CommentID = {comment_id}
        '''
        execute_sql(statement)
        return "Success", 200
    except:
        return "Could not delete comment", 400