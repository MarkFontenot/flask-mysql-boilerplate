from flask import Blueprint, make_response, request, jsonify, Response
from src import db

comments = Blueprint('comments', __name__)

# Gets a comment with the given CommentID
@comments.route('/comments/<int:comment_id>', methods=['GET'])
def get_comment(comment_id: int) -> Response:
    # Get data from DB
    cursor = db.get_db().cursor()
    cursor.execute(f'''
    SELECT * FROM ThoughtComments
    WHERE CommentID = {comment_id};
    ''')

    # JSONify response and return
    column_headers = [x[0] for x in cursor.description]
    json_data = [dict(zip(column_headers, row)) for row in cursor.fetchall()]
    return jsonify(json_data)


# Updates a comment with the given CommentID
@comments.route('/comments/<int:comment_id>', methods=['PUT'])
def update_comment(comment_id: int) -> Response:
    try:
        # Update data in DB
        cursor = db.get_db().cursor()
        cursor.execute(f'''
        UPDATE ThoughtComments
        SET Content = {request.form['content']}
        WHERE CommentID = {comment_id}
        ''')
        
        # Return OK
        return make_response(200)
    except: 
        # Return error
        return make_response(400)


# Deletes a comment with the given CommentID
@comments.route('/comments/<int:comment_id>', methods=['DELETE'])
def delete_comment(comment_id: int):
    try:
        # Update data in DB
        cursor = db.get_db().cursor()
        cursor.execute(f'''
        DELETE FROM ThoughtComments
        WHERE CommentID = {comment_id}
        ''')

        # Return OK
        return make_response(200)
    except:
        return make_response(400)