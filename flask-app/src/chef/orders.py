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
    cursor.execute(f"""SELECT p.title, o.order_id
                       FROM Posts p 
                       JOIN Chefs c ON p.chef_id = c.chef_id 
                       JOIN Users u ON c.user_id = u.user_id
                       JOIN Orders o ON o.post_id = p.post_id
                       WHERE o.accepted = 'true' AND c.chef_id = '{chef_string}'""")

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
    current_app.logger.info(the_data)

    order_id = the_data['order_id']

    query = 'UPDATE Orders SET accepted = \'false\' WHERE order_id =\''
    query += order_id + '\' ;'
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Order accepted!'

@chef.route('/delete_order', methods=['DELETE'])
def accept_order_delete():

    # collecting data from the request object (walkthroguh part 3 22 min for more)
    the_data = request.json
    print(the_data)
    current_app.logger.info(the_data)

    order_id = the_data['order_id']

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
    cursor.execute(f"""SELECT DISTINCT chef_id as label, chef_id as value
                       FROM Chefs""")

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