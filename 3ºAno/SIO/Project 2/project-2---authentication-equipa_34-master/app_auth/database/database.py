from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# Create db
def init_app(app):
    db.init_app(app)
    db.create_all(app=app)