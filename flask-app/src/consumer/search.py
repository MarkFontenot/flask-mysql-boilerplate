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

