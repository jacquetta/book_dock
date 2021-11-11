"""Models for book tracking app"""

from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import backref
from datetime import datetime

db = SQLAlchemy()

class User(db.Model):
    """app user"""

    __tablename__ = "users"

    user_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    full_name = db.Column(db.String, nullable=False)
    email = db.Column(db.String(50), nullable=False, unique=True)
    password = db.Column(db.String(20), nullable=False)
    book_goal = db.Column(db.Integer, default=0)
    goal_date = db.Column(db.DateTime)

    
    def __repr__(self):
        return f'<User email={self.email} password={self.password}>'

class Volume(db.Model):
    """volume(book)"""

    __tablename__ = "volumes"

    volume_id = db.Column(db.String, primary_key=True, nullable=False)
    title = db.Column(db.String, nullable=False)
    authors = db.Column(db.String)
    genre = db.Column(db.String)
    summary = db.Column(db.Text)
    published_date = db.Column(db.DateTime)
    page_count = db.Column(db.Integer)
    img_links = db.Column(db.String)

    
    def __repr__(self):
        return f"<Volume id={self.volume_id} title={self.title} authors={self.authors}>"


class Book_User(db.Model):
    """users who added book"""

    __tablename__ = "bookusers"

    bookuser_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer, db.ForeignKey("users.user_id"), nullable=False)
    volume_id = db.Column(db.String, db.ForeignKey("volumes.volume_id"), nullable=False)
    reading = db.Column(db.String, default=False)
    completed = db.Column(db.String, default=False)

    user = db.relationship("User", backref="bookusers")
    volume = db.relationship("Volume", backref="bookusers")

    def __repr__(self):
        return f"<Book User volume_id={self.volume_id} user={self.user_id} completed={self.completed}>"

class Review(db.Model):
    """user review for book"""

    __tablename__ = "reviews"

    review_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String, nullable=False)
    review_title = db.Column(db.String, nullable=False)
    review = db.Column(db.Text, nullable=False)
    published = db.Column(db.DateTime)
    user_id = db.Column(db.Integer, db.ForeignKey("users.user_id"), nullable=False)
    volume_id = db.Column(db.String, db.ForeignKey("volumes.volume_id"), nullable=False)

    user = db.relationship("User", backref="reviews")
    volume = db.relationship("Volume", backref="reviews")

    def __repr__(self):
        return f"<Review review_title={self.review_title} title={self.title} review={self.review} user={self.user_id}>"



def connect_to_db(flask_app, db_uri="postgresql:///tracker", echo=True):
    flask_app.config["SQLALCHEMY_DATABASE_URI"] = db_uri
    flask_app.config["SQLALCHEMY_ECHO"] = echo
    flask_app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

    db.app = flask_app
    db.init_app(flask_app)

    print("Connected to the db!")

if __name__ == "__main__":
    from server import app


    connect_to_db(app)