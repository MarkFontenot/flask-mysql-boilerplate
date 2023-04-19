from flask import Blueprint, Response, request, jsonify, make_response
from src import db

analytics = Blueprint('analytics', __name__)

# Gets analytics for all of the current user's posts
@analytics.route('/analytics', methods=['GET'])
def get_user_analytics():
    pass

@analytics.route('/analytics/<thought_id>', methods=['GET'])
def get_thought_analytics():
    pass

# Get the users that a given user follows
@analytics.route('/analytics/<int:user_id>/following', methods=['GET'])
def get_following(user_id: int) -> Response:
    # Get data from DB
    cursor = db.get_db().cursor()
    cursor.execute(f"""
    SELECT u.username, u.FirstName, u.LastName, uf.FollowTime
    FROM UserFollows uf
    LEFT JOIN User u ON uf.FollowerID = u.UserID
    WHERE uf.FollowerID = {user_id};
    """)

        # JSONify response and return
    column_headers = [x[0] for x in cursor.description]
    json_data = [dict(zip(column_headers, row)) for row in cursor.fetchall()]
    return jsonify(json_data)


# Adds the posted user as a follower of the given user
@analytics.route('/analytics/<int:user_id>/following', methods=['POST'])
def follow_user(user_id: int) -> Response:
    try:
        followingID: int = int(request.form['followingID'])
        if followingID == user_id: return "Cannot follow self", 400

        # Update data in DB
        cursor = db.get_db().cursor()
        cursor.execute(f'''
        INSERT INTO UserFollows (FollowerID, FollowingID)
        VALUES ({followingID}, {user_id})
        ''')
        db.get_db().commit()

        # Return OK
        return "Success", 200
    except: 
        # Return error
        return "Could not follow user", 400


# The posted user unfollows the given user
@analytics.route('/analytics/<int:user_id>/following', methods=['DELETE'])
def unfollow_user(user_id: int) -> Response:
    try:
        followingID: int = int(request.form['followingID'])

        # Update data in DB
        cursor = db.get_db().cursor()
        cursor.execute(f'''
        DELETE FROM UserFollows 
        WHERE FollowingID = {followingID} and FollowerID = {user_id}
        ''')
        db.get_db().commit()

        # Return OK
        return "Success", 200
    except: 
        # Return error
        return "Could not follow user", 400


# Gets the given user's followers
@analytics.route('/analytics/<int:user_id>/followers', methods=['GET'])
def get_followers(user_id: int) -> Response:
    # Get data from DB
    cursor = db.get_db().cursor()
    cursor.execute(f"""
    SELECT u.username, u.FirstName, u.LastName, uf.FollowTime
    FROM UserFollows uf
    LEFT JOIN User u ON uf.FollowerID = u.UserID
    WHERE uf.FollowingID = {user_id};
    """)

    # JSONify response and return
    column_headers = [x[0] for x in cursor.description]
    json_data = [dict(zip(column_headers, row)) for row in cursor.fetchall()]
    return jsonify(json_data)