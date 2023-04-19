from flask import Blueprint, Response, request
from src.utils import sql_to_json, execute_sql

analytics = Blueprint('analytics', __name__)

# Gets combined analytics for all of a given user's posts
@analytics.route('/user/<int:user_id>', methods=['GET'])
def get_user_analytics(user_id: int):
    query = f'''
    SELECT likes.NumLikes, comments.NumComments, thoughts.NumThoughts
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
    '''
    return sql_to_json(execute_sql(query))


@analytics.route('/thought/<int:thought_id>', methods=['GET'])
def get_thought_analytics(thought_id: int):
    query = f'''
    SELECT likes.NumLikes, comments.NumComments
    FROM (SELECT COUNT(*) NumComments FROM ThoughtComments tc 
        WHERE tc.ThoughtID = {thought_id}) comments
    JOIN (SELECT COUNT(*) NumLikes FROM ThoughtLikes tl 
        WHERE tl.ThoughtID = {thought_id}) likes ON 1 = 1;
    '''
    return sql_to_json(execute_sql(query))


# Get the users that a given user follows
@analytics.route('/user/<int:user_id>/following', methods=['GET'])
def get_following(user_id: int) -> Response:
    query = f"""
    SELECT u.username, u.FirstName, u.LastName, uf.FollowTime
    FROM UserFollows uf
    LEFT JOIN User u ON uf.FollowerID = u.UserID
    WHERE uf.FollowerID = {user_id};
    """
    return sql_to_json(execute_sql(query))


# Adds the posted user as a follower of the given user
@analytics.route('/user/<int:user_id>/following', methods=['POST'])
def follow_user(user_id: int) -> Response:
    try:
        followingID: int = int(request.form['followingID'])
        if followingID == user_id: return "Cannot follow self", 400

        statement = (f'''
        INSERT INTO UserFollows (FollowerID, FollowingID)
        VALUES ({followingID}, {user_id})
        ''')
        execute_sql(statement)
        return "Success", 200
    except: 
        return "Could not follow user", 400


# The posted user unfollows the given user
@analytics.route('/user/<int:user_id>/following', methods=['DELETE'])
def unfollow_user(user_id: int) -> Response:
    try:
        followingID: int = int(request.form['followingID'])

        statement = f'''
        DELETE FROM UserFollows 
        WHERE FollowingID = {followingID} and FollowerID = {user_id}
        '''
        execute_sql(statement)
        return "Success", 200
    except: 
        return "Could not follow user", 400


# Gets the given user's followers
@analytics.route('/user/<int:user_id>/followers', methods=['GET'])
def get_followers(user_id: int) -> Response:
    # Get data from DB
    query = f"""
    SELECT u.username, u.FirstName, u.LastName, uf.FollowTime
    FROM UserFollows uf
    LEFT JOIN User u ON uf.FollowerID = u.UserID
    WHERE uf.FollowingID = {user_id};
    """
    return sql_to_json(execute_sql(query))
