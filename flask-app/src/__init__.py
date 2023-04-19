# Some set up for the application 

from flask import Flask, jsonify, make_response
from flaskext.mysql import MySQL

# create a MySQL object that we will use in other parts of the API
db = MySQL()

def create_app():
    app = Flask(__name__)
    
    # secret key that will be used for securely signing the session 
    # cookie and can be used for any other security related needs by 
    # extensions or your application
    app.config['SECRET_KEY'] = 'someCrazyS3cR3T!Key.!'

    # these are for the DB object to be able to connect to MySQL. 
    app.config['MYSQL_DATABASE_USER'] = 'root'
    app.config['MYSQL_DATABASE_PASSWORD'] = open('/secrets/db_password.txt').readline()
    app.config['MYSQL_DATABASE_HOST'] = 'db'
    app.config['MYSQL_DATABASE_PORT'] = 3306
    app.config['MYSQL_DATABASE_DB'] = 'shower_thoughts'

    # Initialize the database object with the settings above. 
    db.init_app(app)
    
    # Add a default route
    @app.route("/")
    def welcome():
        return "<h1>ShowerThoughts: Where Your Showers Have Thoughts?</h1>"
    
    @app.errorhandler(Exception)
    def handle_exception(e: Exception):
        """Return JSON instead of HTML for HTTP errors."""
        # note: this is actually bad security, but helps for debugging
        return make_response(jsonify({"exception": str(e)}), 400)

    # Import the various routes
    from src.ads.ads                    import ads
    from src.analytics.analytics        import analytics
    from src.comments.comments          import comments
    from src.thoughts.thoughts          import thoughts

    # Register the routes that we just imported so they can be properly handled
    app.register_blueprint(ads,         url_prefix='/ads')
    app.register_blueprint(analytics,   url_prefix='/analytics')
    app.register_blueprint(comments,    url_prefix='/comments')
    app.register_blueprint(thoughts,    url_predix='/t')

    return app