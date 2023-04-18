from flask import Blueprint, request, jsonify, Response, make_response
from src import db

ads = Blueprint('ads', __name__)

@ads.route('/ads', methods=['GET'])
def get_campaigns() -> Response:
    cursor = db.get_db().cursor()
    cursor.execute('''
    SELECT (FirstName, LastName, Email, Title, Cost, CreationDate, StartDate, EndDate) FROM AdCampaign ac
    LEFT JOIN Advertiser a ON ac.AdvertiserID = a.AdvertiserID;
    ''')

    column_headers = [x[0] for x in cursor.description]

    json_data = [dict(zip(column_headers, row)) for row in cursor.fetchall()]
    
    return jsonify(json_data)


@ads.route('/ads/<int:campaign_id>', methods=['GET'])
def get_campaign_analytics(campaign_id: int) -> Response:
    pass


@ads.route('/ads', methods=['POST'])
def create_campaign() -> Response:
    try:
        advertiser_id = request.form['advertiser_id']
        title = request.form['title']
        cost = request.form['cost']
        start_date = request.form['start_date']
        end_date = request.form['end_date']

        cursor = db.get_db().cursor()
        cursor.execute(f'''
        INSERT INTO AdCampaign (AdvertiserID, Title, Cost, StartDate, EndDate) VALUES
        ({advertiser_id}, {title}, {cost}, {start_date}, {end_date});
        ''')
        
        return make_response(200)
    except:
        return make_response(400)


@ads.route('/ads/<int:campaign_id>', methods=['PUT'])
def edit_campaign(campaign_id: int) -> Response:
    try:
        title = request.form['title']
        content = request.form['content']

        cursor = db.get_db().cursor()
        cursor.execute(f'''
        UPDATE AdCampaign
        SET title = {title}, content = {content}
        WHERE CampaignID = {campaign_id};
        ''')

        return make_response(200)
    except:
        return make_response(400)


@ads.route('/ads/<int:campaign_id>/<int:ad_id>', methods=['GET'])
def get_ad_analytics(campaign_id: int, ad_id: int):
    pass


@ads.route('/ads/<int:campaign_id>', methods=['POST'])
def create_ad(campaign_id: int) -> Response:
    try:
        title = request.form['title']
        content = request.form['content']

        cursor = db.get_db().cursor()
        cursor.execute(f'''
        INSERT INTO Advertisement (CampaignID, Title, Content) VALUES
        ({campaign_id}, {title}, {content});
        ''')

        return make_response(200)
    except:
        return make_response(400)


@ads.route('/ads/<int:campaign_id>/<int:ad_id>', methods=['PUT'])
def update_ad(campaign_id: int, ad_id: int) -> Response:
    try:
        title = request.form['title']
        content = request.form['content']

        cursor = db.get_db().cursor()
        cursor.execute(f'''
        UPDATE Advertisement
        SET title = {title}, content = {content}
        WHERE CampaignID = {campaign_id} AND AdID = {ad_id};
        ''')

        return make_response(200)
    except:
        return make_response(400)


@ads.route('/ads/<int:campaign_id>/<int:ad_id>', methods=['DELETE'])
def delete_ad(campaign_id: int, ad_id: int) -> Response:
    try:
        cursor = db.get_db().cursor()
        cursor.execute(f'''
        DELETE FROM Advertisement
        WHERE CampaignID = {campaign_id} AND AdID = {ad_id};
        ''')

        return make_response(200)
    except:
        return make_response(400)