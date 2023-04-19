from flask import Blueprint, request, Response
from src.utils import sql_to_json, execute_sql


# how many cents an ad view earns
VIEW_REVENUE = 0.05
# how many cents an ad click earns
CLICK_REVENUE = 0.10


ads = Blueprint('ads', __name__)


@ads.route('/campaigns', methods=['GET'])
def get_campaigns() -> Response:
    """Return all ad campaigns with their advertiser and advertiser contact information."""
    query = '''
        SELECT
            CampaignID,
            Title, 
            StartDate, 
            EndDate, 
            Cost, 
            Advertiser.AdvertiserID,
            Name AS AdvertiserName, 
            CONCAT(FirstName, " ", LastName) AS ContactName, 
            Email AS ContactEmail, 
            AdCampaign.CreationDate as CreationDate
        FROM AdCampaign
        LEFT JOIN Advertiser ON AdCampaign.AdvertiserID = Advertiser.AdvertiserID
        LEFT JOIN AdvertiserContact ON Advertiser.ContactID = AdvertiserContact.ContactID
        ORDER BY EndDate;
    '''
    return sql_to_json(execute_sql(query))


@ads.route('/campaigns', methods=['POST'])
def create_campaign() -> Response:
    """Create an ad campaign."""
    try:
        advertiser_id = request.form['advertiser_id']
        title = request.form['title']
        cost = request.form['cost']
        start_date = request.form['start_date']
        end_date = request.form['end_date']

        create = f'''
            INSERT INTO AdCampaign (AdvertiserID, Title, Cost, StartDate, EndDate) VALUES
            ({advertiser_id}, "{title}", {cost}, "{start_date}", "{end_date}");
        '''
        execute_sql(create)

        return ('Success', 200)
    except:
        return ('Could not create campaign', 400)


@ads.route('/campaigns/<int:campaign_id>', methods=['GET'])
def get_campaign_analytics(campaign_id: int) -> Response:
    """Return analytics for a particular ad campaign."""
    query = f'''
        SELECT Interaction, Count(*) as Count, Sum(Revenue) as Revenue
        FROM 
            (SELECT *, "View" as Interaction, {VIEW_REVENUE} as Revenue FROM AdViews 
            UNION 
            SELECT *, "Click" as Interaction, {CLICK_REVENUE} as Revenue FROM AdClicks) as Interactions
        LEFT JOIN Advertisement ON Advertisement.AdID = Interactions.AdID
        WHERE CampaignID = {campaign_id}
        GROUP BY Interaction;
    '''
    return sql_to_json(execute_sql(query))


@ads.route('/campaigns/<int:campaign_id>', methods=['PUT'])
def edit_campaign(campaign_id: int) -> Response:
    """Update a campaign."""
    try:
        title = request.form['title']
        advertiser_id = request.form['advertiser_id']

        update = f'''
            UPDATE AdCampaign
            SET Title = "{title}", AdvertiserID = {advertiser_id}
            WHERE CampaignID = {campaign_id};
        '''
        execute_sql(update)

        return ('Success', 200)
    except:
        return ('Failed to update the campaign', 400)
    

@ads.route('/campaigns/<int:campaign_id>/ads', methods=['GET'])
def get_campaign_ads(campaign_id: int) -> Response:
    """Get ads under a particular campaign."""
    query = f'''
        SELECT * FROM Advertisement
        WHERE CampaignID = {campaign_id};
    '''
    return sql_to_json(execute_sql(query))


@ads.route('/campaigns/<int:campaign_id>/ads/<int:ad_id>', methods=['GET'])
def get_ad_analytics(campaign_id: int, ad_id: int):
    """Get analytics for a particular ad."""
    query = f'''
        SELECT Interaction, Count(*) as Count, Sum(Revenue) as Revenue FROM
        (SELECT *, "View" as Interaction, {VIEW_REVENUE} as Revenue FROM AdViews WHERE AdID = {ad_id}
        UNION 
        SELECT *, "Click" as Interaction, {CLICK_REVENUE} as Revenue FROM AdClicks WHERE AdID = {ad_id}) as Interactions
        GROUP BY Interaction;
    '''
    return sql_to_json(execute_sql(query))


@ads.route('/campaigns/<int:campaign_id>/ads', methods=['POST'])
def create_ad(campaign_id: int) -> Response:
    """Create a new ad under a campaign."""
    try:
        title = request.form['title']
        content = request.form['content']

        create = f'''
            INSERT INTO Advertisement (CampaignID, Title, Content) VALUES
            ({campaign_id}, "{title}", "{content}");
        '''
        execute_sql(create)

        return ('Success', 200)
    except:
        return ('Failed to create a new ad', 400)


@ads.route('/campaigns/<int:campaign_id>/ads/<int:ad_id>', methods=['PUT'])
def update_ad(campaign_id: int, ad_id: int) -> Response:
    """Update an ad."""
    try:
        title = request.form['title']
        content = request.form['content']

        update = f'''
            UPDATE Advertisement
            SET Title = "{title}", Content = "{content}"
            WHERE CampaignID = {campaign_id} AND AdID = {ad_id};
        '''
        execute_sql(update)

        return ('Success', 200)
    except:
        return ('Failed to update the ad', 400)


@ads.route('/campaigns/<int:campaign_id>/ads/<int:ad_id>', methods=['DELETE'])
def delete_ad(campaign_id: int, ad_id: int) -> tuple[str, int]:
    """Delete an ad."""
    try:
        delete = f'''
            DELETE FROM Advertisement
            WHERE CampaignID = {campaign_id} AND AdID = {ad_id};
        '''
        execute_sql(delete)

        return ('Success', 200)
    except:
        return ('Failed to delete the ad', 400)
