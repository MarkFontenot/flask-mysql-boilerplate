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

# Get all members of a support group
@patients.route('/support_group/<support_group_id>/members', methods=['GET'])
def get_support_group_members(support_group_id):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT u.user_id, u.name FROM user u JOIN member_of m ON u.user_id = m.user_id WHERE m.support_group_id = {0}'.format(support_group_id))
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
@patients.route('/cancer_type/<cancer_type_id>/treatments', methods=['GET'])
def get_typical_treatments(cancer_type_id):
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

@patients.route('/cancer_type/<cancer_type_id>/support_groups', methods=['GET'])
def get_support_groups_by_cancer_type(cancer_type_id):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT sg.support_group_id, sg.name FROM support_group sg JOIN typically_supports ts ON sg.support_group_id = ts.support_group_id WHERE ts.cancer_type_id = {0}'.format(cancer_type_id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@patients.route('/support_group/<support_group_id>/cancer_type/<cancer_type_id>/users', methods=['GET'])
def get_users_by_support_group_and_cancer_type(support_group_id, cancer_type_id):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT u.user_id, u.name FROM user u JOIN member_of m ON u.user_id = m.user_id WHERE m.support_group_id = {0} AND u.cancer_type_id = {1}'.format(support_group_id, cancer_type_id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
