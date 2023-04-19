from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


critic = Blueprint('critic', __name__)

# Get all recipes from the database (with given body filters)
@critic.route('/recipes', methods=['GET'])
def get_recipes():
    # get a cursor object from the database
    cursor = db.get_db().cursor()


    body = request.get_json()
    category = body['category']
    course = ''
    diet = ''
    if category != '':
        splitCategory = category.split(",")
        course = splitCategory[0].strip()
        diet = splitCategory[1].strip()
    cuisine = body['cuisine']
    ingredients = body['ingredients']
    categoryString = ''
    cuisineString = ''
    whereString = ''
    innerWhereString = ''
    

    if course != '' and diet !='':
        categoryString = f'(course=\'{course}\' AND dietType=\'{diet}\')'
    elif course != '':
        categoryString = f'(course={course})'
    elif diet != '':
        categoryString = f'(dietType={diet})'

    if cuisine is not None and len(cuisine[0]) != 0:
        cuisine = 'origin IN (' + ",".join('\'' + c + '\'' for c in cuisine[0]) + ')'

    if categoryString != '' and cuisineString != '':
        whereString = 'WHERE ' + categoryString + ' OR ' + cuisineString # change to AND
    elif categoryString != '':
        whereString = 'WHERE ' + categoryString
    elif cuisineString != '':
        whereString = 'WHERE ' + cuisineString

    if ingredients is not None and len(ingredients[0]) > 0:
        innerWhereString = 'WHERE I.name IN (' + ",".join('\'' + i + '\'' for i in ingredients[0]) + ')'

    query=f'''
        SELECT RWI.title,
        RWI.recipeID,
        CONCAT(RC.fName, ' ', RC.lName) as creatorName,
        C.course,
        C.dietType,
        CO.origin FROM Recipes R
            JOIN Recipe_Creator RC on R.creatorID = RC.creatorID
            JOIN Categories C on R.categoryID = C.categoryID
            JOIN Cuisine_Origins CO on R.originID = CO.originID
                JOIN
                (SELECT R.title, R.recipeID FROM Recipes R
            JOIN Recipe_Ingredients RI on R.recipeID = RI.recipeID
            JOIN Ingredients I on RI.ingredientID = I.ingredientID
            {innerWhereString}
        GROUP BY R.recipeID) as RWI on R.recipeID=RWI.recipeID
        {whereString}
        ORDER BY R.date_created;
    '''

    # use cursor to query the database for a list of products
    cursor.execute(query)

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# get all ingredients in database
@critic.route('/ingredients')
def get_ingredients():
    cursor = db.get_db().cursor()
    query = '''
        SELECT DISTINCT name as label, name as value from Ingredients
    '''
    cursor.execute(query)
       # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# get all ingredients in database
@critic.route('/cuisine')
def get_cuisine():
    cursor = db.get_db().cursor()
    query = '''
        SELECT DISTINCT origin as label, origin as value FROM Cuisine_Origins
    '''
    cursor.execute(query)
       # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# get all ingredients in database
@critic.route('/categories')
def get_category():
    cursor = db.get_db().cursor()
    query = '''
        SELECT DISTINCT CONCAT(course, ', ', dietType) as label, CONCAT(course, ', ', dietType) as value FROM Categories
    '''
    cursor.execute(query)
       # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


@critic.route('/recipes/<id>')
def get_recipe_by_id(id):
    cursor = db.get_db().cursor()
    query = f'''
        SELECT R.title,
            R.difficulty,
            CO.origin,
            CONCAT(C.course, ', ', C.dietType) as category,
            R.description
        FROM Recipes R
            JOIN Categories C on C.categoryID = R.categoryID
            JOIN Cuisine_Origins CO on R.originID = CO.originID
        WHERE R.recipeID={id}
    '''
    cursor.execute(query)
       # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

@critic.route('/recipes/<id>/instructions')
def get_recipe_instructions_by_id(id):
    cursor = db.get_db().cursor()
    query = f'''
        SELECT S.stepNum, S.step from Instructions I
            JOIN Instruction_Step S on I.instructionID = S.instructionID
            WHERE I.recipeID={id};
    '''
    cursor.execute(query)
       # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

@critic.route('/recipes/<id>/ingredients')
def get_recipe_ingredients_by_id(id):
    cursor = db.get_db().cursor()
    query = f'''
        SELECT I.name, RI.amount, RI.unit from Ingredients I
            JOIN Recipe_Ingredients RI on I.ingredientID = RI.ingredientID
            WHERE RI.recipeID={id}
    '''
    cursor.execute(query)
       # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

@critic.route('/accounts/creators')
def get_creators():
    cursor = db.get_db().cursor()
    query = '''
        SELECT CONCAT(fName, ' ', lName) as fullName, creatorID FROM Recipe_Creator
    '''
    cursor.execute(query)
       # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

@critic.route('/accounts/critics')
def get_critics():
    cursor = db.get_db().cursor()
    query = '''
        SELECT *, CONVERT(criticID, char) as value, email as label FROM Recipe_Critic
    '''
    cursor.execute(query)
       # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

@critic.route('/following/<id>', methods=['GET'])
def get_following(id):
    cursor = db.get_db().cursor()
    query = f'''
        SELECT CONCAT(RC.fName, ' ', RC.lName) as fullName, F.creatorID FROM Recipe_Critic C
            JOIN Following F on C.criticID = F.criticID
            JOIN Recipe_Creator RC on F.creatorID = RC.creatorID
        WHERE C.criticID={id}
    '''
    cursor.execute(query)
       # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# /creator/{id}/following

@critic.route('/following/<id>',  methods=['POST'])
def post_following(id):
    body = request.get_json()
    creator = str(body['creator'])

    current_app.logger.info(creator)

    query = f'''
        INSERT INTO Following (criticID, creatorID) VALUES ({id}, {creator})
    '''

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Success'

@critic.route('/following/<id>',  methods=['DELETE'])
def delete_following(id):

    body = request.get_json()
    creator = str(body['creator'])

    query = f'''
        DELETE FROM Following WHERE criticID={str(id)} AND creatorID={str(creator)};
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Success'


@critic.route('/bookmarks/<id>', methods=['GET'])
def get_bookmarks(id):
    cursor = db.get_db().cursor()
    query = f'''
        SELECT R.title, CONCAT(RC.fName, ' ', RC.lName) as fullName, R.recipeID FROM Bookmarks B
            JOIN Recipes R  on R.recipeID = B.recipeID
            JOIN Recipe_Creator RC on RC.creatorID = R.creatorID
            JOIN Recipe_Critic C on B.criticID = C.criticID
        WHERE C.criticID={id};
    '''
    cursor.execute(query)
       # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)