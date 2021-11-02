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

    volume_id = db.Column(db.String, primary_key=True)
    title = db.Column(db.String, nullable=False)
    authors = db.Column(db.String)
    genre = db.Column(db.String)
    summary = db.Column(db.Text)
    published_date = db.Column(db.Date)
    page_count = db.Column(db.Integer)
    img_links = db.Column(db.String)

    def __repr__(self):
        return f"<Volume id={self.volume_id} title={self.title} authors={self.authors}>"


class Book_Users(db.Model):
    """users who added book"""

    __tablename__ = "bookusers"
    bookuser_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer, db.ForeignKey(users.user_id))
    volume_id = db.Column(db.String, db.ForeignKey(volumes.volume_id))
    completed = db.Column(db.String, default=True)

class Review(db.Model):
    """user review for book"""

    __tablename__ = "reviews"