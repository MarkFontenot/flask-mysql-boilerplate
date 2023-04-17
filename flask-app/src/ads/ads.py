from flask import Blueprint, request, jsonify, make_response
from src import db

ads = Blueprint('ads', __name__)

# Get all ad campaigns from the database
@ads.route('/ads', methods=['GET'])
def get_ad_campaigns():
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


@ads.route('/ads', methods=['POST'])
def create_ad_campaign():
    pass

@ads.route('/ads/<campaign_id>', methods=['GET'])
def get_campaign_analytics():
    pass

@ads.route('/ads/<campaign_id>', methods=['POST'])
def add_ad_to_campaign():
    pass

@ads.route('/ads/<campaign_id>', methods=['PUT'])
def edit_ad_campaign():
    pass

@ads.route('/ads/<campaign_id>/<ad_id>', methods=['GET'])
def get_ad_analytics():
    pass

@ads.route('/ads/<campaign_id>/<ad_id>', methods=['PUT'])
def update_advertisement():
    pass

@ads.route('/ads/<campaign_id>/<ad_id>', methods=['DELETE'])
def delete_advertisement():
    pass