from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db
# from src.consumer import consumer

chef = Blueprint('chef', __name__)

# Get all the products from the database
@chef.route('/list_orders', methods=['GET'])
def list_orders():
    chef_string = request.args.get('chef_id')

    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute(f"""SELECT p.title, u.username, o.order_id
                       FROM Posts p 
                       JOIN Chefs c ON p.chef_id = c.chef_id
                       JOIN Orders o ON o.post_id = p.post_id
                       JOIN Consumers co ON o.consumer_id = co.consumer_id
                       JOIN Users u ON co.user_id = u.user_id
                       WHERE o.accepted = 'false' AND c.chef_id = '{chef_string}'""")

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

@chef.route('/accept_order', methods=['PUT'])
def accept_order():

    # collecting data from the request object (walkthroguh part 3 22 min for more)
    the_data = request.json

    order_id = str(the_data['order_id'])

    query = 'UPDATE Orders SET accepted = \'true\' WHERE order_id =\''
    query += order_id + '\' ;'

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Order accepted!'

@chef.route('/delete_order', methods=['DELETE'])
def order_delete():

    # collecting data from the request object (walkthroguh part 3 22 min for more)
    the_data = request.json
    current_app.logger.info(the_data)

    order_id = str(the_data['order_id'])

    query = 'DELETE FROM Orders WHERE order_id =\''
    query += order_id + '\' ;'
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Order deleted!'

@chef.route('/list_chefs', methods=['GET'])
def list_chefs():

    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute(f"""SELECT DISTINCT u.username as label, c.chef_id as value
                       FROM Chefs c
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

# Get all the products from the database
@chef.route('/chef', methods=['POST'])
def create_post():
    the_data = request.json

    chefid = the_data['chef_id']
    title = the_data['title']
    description = the_data['description']
    currentlyAvialable = the_data['currently_available']
    expectedTime = the_data['expected_time']
    needDelivery = the_data['need_delivery']
    price = the_data['price']


    query = 'insert into Posts (chef_id, title, description, currently_available, expected_time, need_delivery, price) values ("'
    query += chefid + '", "'
    query += title + '", "'
    query += description + '", "'
    query += currentlyAvialable + '", "'
    query += expectedTime + '", "'
    query += needDelivery + '", "'
    query += '$' + str(price) + '")'


    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Posted!'



@chef.route('/chef_reviews', methods=['GET'])
def get_chef_reviews():
    chef_id = request.args.get('chef_id')

    cursor = db.get_db().cursor()

    # # use cursor to query the database for a list of products
    cursor.execute(f"""SELECT cr.rating, cr.description, u.username FROM ChefReviews cr
                       JOIN Users u ON cr.reviewer_id = u.user_id
                       WHERE cr.chef_id = '{chef_id}'""")

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

@chef.route('/chef_posts', methods=['GET'])
def get_own_posts():
    chef_id = request.args.get('chef_id')

    cursor = db.get_db().cursor()

    # # use cursor to query the database for a list of products
    cursor.execute(f"""SELECT * FROM Posts p
                       WHERE p.chef_id = '{chef_id}'""")

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

@chef.route('/deliveries', methods=['GET'])
def get_deliveries():
    chef_id = request.args.get('chef_id')

    cursor = db.get_db().cursor()

    # # use cursor to query the database for a list of products
    cursor.execute(f"""SELECT d.delivery_id, d.order_id, u.username AS driver_name, d.expected_pickup, d.expected_delivery, d.pickup_address, d.delivery_address 
                       FROM Deliveries d
                       JOIN Drivers dr ON d.driver_id = dr.driver_id
                       JOIN Users u ON dr.user_id = u.user_id
                       JOIN Orders o ON o.order_id = d.order_id
                       JOIN Posts p ON p.post_id = o.post_id
                       WHERE p.chef_id = '{str(chef_id)}'""")

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

