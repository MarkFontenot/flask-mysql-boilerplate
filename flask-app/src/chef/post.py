from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db
# from src.consumer import consumer

<<<<<<< HEAD
chef = Blueprint('chef', __name__)
=======

chef = Blueprint('chef', __name__)

>>>>>>> dd48b69b2dfda3d442856ad9295aff10ba929a16

# Get all the products from the database
@chef.route('/chef', methods=['POST'])
def create_post():
   
    the_data = request.json
    current_app.logger.info(the_data)


    postid = the_data['post_id']
    chefid = the_data['chef_id']
    title = the_data['title']
    description = the_data['description']
    currentlyAvialable = the_data['currently_available']
    expectedTime = the_data['expected_time']
    needDelivery = the_data['need_delivery']
    price = the_data['price']


    query = 'insert into posts (name) values ("'
    query += postid + '", "'
    query += chefid + '", "'
    query += title + '", "'
    query += description + '", "'
    query += currentlyAvialable + '", "'
    query += expectedTime + '", "'
    query += needDelivery + '", '
    query += str(price) + ')'
    current_app.logger.info(query)


    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()


    return 'Posted!'