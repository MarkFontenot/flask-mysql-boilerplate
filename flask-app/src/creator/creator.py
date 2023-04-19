from flask import Blueprint, request, jsonify, make_response
import json
from src import db

creator = Blueprint('creator', __name__)

@creator.route('/categories', methods=['GET'])
def get_categories():
    cursor = db.get_db().cursor()

    cursor.execute('SELECT categoryID, course, dietType FROM Categories')

    column_headers = [x[0] for x in cursor.description]

    json_data = []

    theData = cursor.fetchall()

    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    
    return jsonify(json_data)

@creator.route('/origins', methods=['GET'])
def get_origins():
    cursor = db.get_db().cursor()

    cursor.execute('SELECT originID, origin FROM Cuisine_Origins')

    column_headers = [x[0] for x in cursor.description]

    json_data = []

    theData = cursor.fetchall()

    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    
    return jsonify(json_data)
