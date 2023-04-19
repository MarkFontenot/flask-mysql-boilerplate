from flask import jsonify, Response

from src import db

def sql_to_json(cursor) -> Response:
    """Helper function for converting SQL rows into JSON data.
    
    Simply creates an array where each row is a dictionary of ColumnName -> ColumnValue.
    """
    column_headers = [x[0] for x in cursor.description]
    json_data = [dict(zip(column_headers, row)) for row in cursor.fetchall()]
    return jsonify(json_data)

def execute_sql(query: str):
    """Helper function for executing a given SQL query.
    
    Returns the SQL cursor for further database access.
    """
    cursor = db.get_db().cursor()
    cursor.execute(query)
    return cursor
