from flask import Blueprint, Response, request, jsonify, make_response
from src import db

analytics = Blueprint('analytics', __name__)

# Gets combined analytics for all of a given user's posts
@analytics.route('/analytics/user/<int:user_id>', methods=['GET'])
def get_user_analytics(user_id: int):
    # Get data from DB
    cursor = db.get_db().cursor()
    cursor.execute(f'''
    SELECT likes.NumLikes, comments.NumComments, thoughts.NumTHoughts
    FROM (SELECT COUNT(*) NumComments FROM ThoughtComments
    LEFT OUTER JOIN Thought T on ThoughtComments.ThoughtID = T.ThoughtID
        WHERE T.UserID = {user_id}) comments
    JOIN
        (SELECT COUNT(*) NumLikes FROM ThoughtLikes
            LEFT OUTER JOIN Thought T on ThoughtLikes.ThoughtID = T.ThoughtID
            WHERE T.UserID = {user_id}) likes ON 1 = 1
    JOIN 
        (SELECT COUNT(*) NumThoughts FROM Thought 
        WHERE UserID = {user_id}) thoughts ON 1 = 1;
    ''')

    # JSONify response and return
    column_headers = [x[0] for x in cursor.description]
    json_data = [dict(zip(column_headers, row)) for row in cursor.fetchall()]
    return jsonify(json_data)


@analytics.route('/analytics/thought/<int:thought_id>', methods=['GET'])
def get_thought_analytics(thought_id: int):
    cursor = db.get_db().cursor()
    cursor.execute(f'''
    SELECT likes.NumLikes, comments.NumComments
    FROM (SELECT COUNT(*) NumComments FROM ThoughtComments tc 
        WHERE tc.ThoughtID = {thought_id}) comments
    JOIN (SELECT COUNT(*) NumLikes FROM ThoughtLikes tl 
        WHERE tl.ThoughtID = {thought_id}) likes ON 1 = 1;
    ''')
    
    # JSONify response and return
    column_headers = [x[0] for x in cursor.description]
    json_data = [dict(zip(column_headers, row)) for row in cursor.fetchall()]
    return jsonify(json_data)

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