"""CRUD"""

from model import db, User, Book_User, Volume, Review, connect_to_db
from datetime import datetime

if __name__ == '__main__':
    from server import app
    connect_to_db(app)

"""create a new user"""
def new_user(full_name, email, password, book_goal, goal_date):
    user = User(full_name=full_name, email=email, password=password, book_goal=book_goal, goal_date=goal_date)

    db.session.add(user)
    db.session.commit()
    return user

"""user login"""
def login(email, password):
    return User.query.filter((User.email == email) & (User.password == password)).first()

"""get all users"""
def all_users():
    return User.query.all()

"""get user_id"""
def get_user_id(user_id):
    return User.query.get(user_id)

"""get user email"""
def get_user_email(email):
    return User.query.filter(User.email == email).first()

"""create a volume"""
def create_volume(title, authors, genre, summary, published_date, page_count, img_links):
    volume = Volume(title=title, authors=authors, genre=genre, summary=summary, published_date=published_date, page_count=page_count, img_links=img_links)

    db.session.add(volume)
    db.session.commit()
    return volume

"""return all volumes"""
def all_volumes():
    return Volume.query.all()

"""get volume_id"""
def get_volume_id(volume_id):
    return Volume.query.get(volume_id).first()

"""get book_users id"""
def get_bookuser_id(bookuser_id):
    return Book_User.query.get(bookuser_id).first()

"""create a new review"""
def create_review(title, review_title, review, published, user_id, volume_id):
    user_review = Review(title=title, review_title=review_title, review=review, published=published, user_id=user_id, volume_id=volume_id)

    db.session.add(user_review)
    db.session.commit()
    return user_review

"""list all reviews for book"""
def book_reviews():
    return Review.query.all()