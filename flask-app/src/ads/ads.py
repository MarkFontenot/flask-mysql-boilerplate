from flask import Blueprint, request, jsonify, make_response
from src import db

ads = Blueprint('ads', __name__)

# Get all ad campaigns from the database
@ads.route('/ads', methods=['GET'])
def get_ads():
    cursor = db.get_db().cursor()
    cursor.execute('''
    SELECT * FROM AdCampaign ac
    LEFT JOIN Advertiser a ON ac.AdvertiserID = a.AdvertiserID;
    ''')

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    json_data = []

    theData = cursor.fetchall()

    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    
    return jsonify(json_data)