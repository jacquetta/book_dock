"""Models for book tracking app"""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class User(db.Model):
    """app user"""

    __tablename__ = "users"

    user_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    full_name = db.Column(db.String, nullable=False, unique=True)
    email = db.Column(db.String(50), nullable=False)
    password = db.Column(db.String(20), nullable=False)
    book_goal = db.Column(db.Integer)
    goal_date = db.Column(db.Date)

    def __repr__(self):
        return f"<User email={self.email} name={self.name}>"


class Volume(db.Model):
    """volume(book)"""

    __tablename__ = "volumes"


class Book_Users(db.Model):
    """users who added book"""

    __tablename__ = "bookusers"

class Review(db.Model):
    """user review for book"""

    __tablename__ = "reviews"