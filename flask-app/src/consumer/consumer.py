from flask import Blueprint, request, jsonify, make_response
import json
from src import db
# from src.consumer import consumer

consumer = Blueprint('consumer', __name__)

# Get all the products from the database
@consumer.route('/search_posts', methods=['GET'])
def search_posts():
    search_string = request.args.get('search')

    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute(f"""SELECT p.title, p.price, p.expected_time, u.username AS author
                       FROM Posts p 
                       JOIN Chefs c ON p.chef_id = c.chef_id 
                       JOIN Users u ON c.user_id = u.user_id 
                       WHERE p.currently_available = 'true' AND p.title LIKE '%{search_string}%'""")

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

# Get all the products from the database
@consumer.route('/post', methods=['GET'])
def get_post():
    post_id = request.args.get('post_id')

    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute(f"""SELECT p.title, p.price, p.description, p.currently_available, p.need_delivery, p.expected_time, u.username AS author
                       FROM Posts p 
                       JOIN Chefs c ON p.chef_id = c.chef_id 
                       JOIN Users u ON c.user_id = u.user_id 
                       WHERE p.post_id = '{post_id}'""")

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

    return jsonify(json_data[0])

@consumer.route('/order', methods=['POST'])
def create_order():
    
    # collecting data from the request object 
    body = request.json

    # Constructing the query
    query = 'insert into Orders (post_id, consumer_id, accepted) values ("'
    query += str(body['post_id']) + '", "'
    query += str(body['consumer_id']) + '", "'
    query += 'false' + '")'

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'


@consumer.route('/orders', methods=['GET'])
def get_orders_for_post():
    consumer_id = request.args.get('consumer_id')
    post_id = request.args.get('post_id')

    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # # use cursor to query the database for a list of products
    cursor.execute(f"""SELECT o.order_id, o.create_timestamp, o.accepted
                       FROM Orders o
                       WHERE o.post_id = '{post_id}' AND o.consumer_id = '{consumer_id}'""")

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

@consumer.route('/consumers', methods=['GET'])
def list_all_consumers():

    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute(f"""SELECT DISTINCT u.username as label, c.consumer_id as value
                       FROM Consumers c
                       JOIN Users u ON c.user_id = u.user_id""")

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


@consumer.route('/posts', methods=['GET'])
def list_all_posts():

    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute(f"""SELECT title AS label, post_id AS value
                       FROM Posts """)

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

@consumer.route('/post_review', methods=['POST'])
def create_post_review():
    # collecting data from the request object 
    body = request.json

    # Constructing the query
    query = 'INSERT INTO PostReviews (post_id, consumer_id, rating, description) values ("'
    query += str(body['post_id']) + '", "'
    query += body['consumer_id'] + '", "'
    query += str(body['rating']) + '", "'
    query += body['description'] + '")'

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

@consumer.route('/post_review', methods=['PUT'])
def edit_post_review():
    # collecting data from the request object (walkthroguh part 3 22 min for more)
    body = request.json

    query = f"UPDATE PostReviews SET rating = '{str(body['rating'])}', description = '{str(body['description'])}' WHERE post_review_id = '{str(body['post_review_id'])}';"

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Success!'

@consumer.route('/post_review', methods=['DELETE'])
def delete_post_review():
    # collecting data from the request object 
    body = request.json

    # Constructing the query
    query = f"DELETE FROM Orders WHERE order_id = '{str(body['post_review_id'])}';"
    
    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'