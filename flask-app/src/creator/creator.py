from flask import Blueprint, request, jsonify, make_response
import json
from src import db

creator = Blueprint('creator', __name__)

# Gets the recipe with the given id 
@creator.route('/recipes/<recipeID>', methods=['GET'])
def get_recipes_id(recipeID):
    cursor = db.get_db().cursor()
    query = '''
    SELECT *
    FROM Recipes
    WHERE recipeID = {0};
    '''.format(recipeID)

    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Deletes the recipe with the given id 
@creator.route('/recipes/<recipeID>', methods=['DELETE'])
def del_recipes_id(recipeID):
    cursor = db.get_db().cursor()
    query = '''
    DELETE FROM Recipes
    WHERE recipeID = {0};
    '''.format(recipeID)

    cursor.execute(query)
    the_response = make_response()
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Updates the name of the recipe with the given id 
@creator.route('/recipes/<recipeID>', methods=['PUT'])
def put_recipes_id(recipeID):
    cursor = db.get_db().cursor()
    title = request.form.get('title')

    query = '''
    UPDATE Recipes
    SET title = '{0}'
    WHERE recipeID = {1};
    '''.format(title, recipeID)

    cursor.execute(query)
    the_response = make_response()
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Creates a new ingredient 
@creator.route('/ingredients', methods=['POST'])
def post_ingredient():
    cursor = db.get_db().cursor()

    body = request.get_json()
    name = body['name']
    query = '''
    insert into Ingredients (name) values ('{0}');
    '''.format(name)

    cursor.execute(query)
    the_response = make_response()
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Gets all recipes for the given user 
@creator.route('/creator/<creatorID>/recipes', methods=['GET'])
def get_creator_public_recipes(creatorID):
    cursor = db.get_db().cursor()
    query = '''
    SELECT recipeID, title, servings, difficulty, description, originID, categoryID, date_created
    FROM Recipe_Creator
    JOIN Recipes USING (creatorID)
    WHERE creatorID = {0};
    '''.format(creatorID)

    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Gets all users following the creator with the given id
@creator.route('/creator/<creatorID>/following')
def get_creator_followers(creatorID):
    cursor = db.get_db().cursor()
    query = '''
    SELECT Following.criticID
    FROM Recipe_Creator
    JOIN Following USING (creatorID)
    WHERE creatorID = {0};
    '''.format(creatorID)

    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Gets a list of all recipe creator accounts
@creator.route('/accounts/creator', methods=['GET'])
def get_creators():
    cursor = db.get_db().cursor()
    query = '''
    SELECT *
    FROM Recipe_Creator;
    '''
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Gets the recipe creator account with the given id 
@creator.route('/accounts/creator/<creatorID>', methods=['GET'])
def get_creator_from_id(creatorID):
    cursor = db.get_db().cursor()
    query = '''
    SELECT *
    FROM Recipe_Creator
    WHERE creatorID = {0};
    '''.format(creatorID)
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Gets a list of reviews for the specified recipe
@creator.route('/recipes/<recipeID>/review', methods=['GET'])
def get_recipe_reviews(recipeID):
    cursor = db.get_db().cursor()
    query = '''
    SELECT reviewID, stars, comment, criticID, date_reviewed
    FROM Recipes
    JOIN Reviews USING (recipeID)
    WHERE recipeID = {0};
    '''.format(recipeID)

    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Gets all of the instructions for the given recipe
@creator.route('/recipes/<recipeID>/instructions', methods=['GET'])
def get_recipe_instructions(recipeID):
    cursor = db.get_db().cursor()
    query = '''
    SELECT instructionID, cookTime, prepTime, step, stepNum
    FROM Recipes
    JOIN Instructions USING (recipeID)
    JOIN Instruction_Step USING (instructionID)
    WHERE Recipes.recipeID = {0};
    '''.format(recipeID)

    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)