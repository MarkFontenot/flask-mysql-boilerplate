from flask import Blueprint, request, jsonify, make_response
import json
from src import db


patients = Blueprint('user', __name__)

# Get all users from the DB and their cancer type id
@patients.route('/user', methods=['GET'])
def get_users():
    cursor = db.get_db().cursor()
    cursor.execute('select cancer_type_id from user')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get cancer_type_id for particular user
@patients.route('/user/<cancer_type_id>', methods=['GET'])
def get_users(user_id):
    cursor = db.get_db().cursor()
    cursor.execute('select * from user where cancer_type_id = {0}'.format(cancer_type_id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
