from flask import Blueprint, request, jsonify, make_response
import json
from src import db
# from src.consumer import consumer

chef = Blueprint('chef', __name__)

# Get all the products from the database
@chef.route('/list_orders', methods=['GET'])
def list_orders():

    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute(f"""SELECT p.title, o.order_id
                       FROM Posts p 
                       JOIN Chefs c ON p.chef_id = c.chef_id 
                       JOIN Users u ON c.user_id = u.user_id
                       JOIN Orders o ON o.post_id = p.post_id
                       WHERE o.accepted = 'true'""")

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