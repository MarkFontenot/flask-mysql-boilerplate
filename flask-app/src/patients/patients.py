from flask import Blueprint, request, jsonify, make_response
import json
from src import db

patients = Blueprint('user', __name__)

# Get all users from the DB and their cancer type id
@patients.route('/user', methods=['GET'])
def get_users():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT cancer_type_id FROM user')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get users with specified cancer type ID
@patients.route('/user/<cancer_type_id>', methods=['GET'])
def get_users_by_cancer_type(cancer_type_id):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM user WHERE cancer_type_id = {0}'.format(cancer_type_id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get all cancer types typically associated with a given symptom
@patients.route('/typically_exhibits/<symptom_id>', methods=['GET'])
def typically_exhibits(symptom_id):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT ct.cancer_type_id, ct.name FROM cancer_type ct JOIN typically_exhibits te ON ct.cancer_type_id = te.cancer_type_id WHERE te.symptom_id = {0}'.format(symptom_id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get all treatments typically used for a given cancer type
@patients.route('/treatment/<cancer_type_id>', methods=['GET'])
def treatment(cancer_type_id):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT t.treatment_id, t.name FROM treatment t JOIN typically_treated_with tt ON t.treatment_id = tt.treatment_id WHERE tt.cancer_type_id = {0}'.format(cancer_type_id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

