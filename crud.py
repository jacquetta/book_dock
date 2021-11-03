"""CRUD"""

from model import db, User, Book_User, Volume, Review, connect_to_db
from datetime import datetime

if __name__ == '__main__':
    from server import app
    connect_to_db(app)

"""create a new user"""
def new_user(full_name, email, password, book_goal, date_goal):
    user = User(full_name=full_name, email=email, password=password, book_goal=book_goal, date_goal=date_goal)

    db.session.add(user)
    db.session.commit()
    return user

"""user login"""
def login(email, password):
    return User.query.filter(User.email == email) & (User.password == password)

"""get all users"""
def all_users():
    return User.query.all()

"""get user_id"""
def get_user_id(user_id):
    return User.query.get(user_id)

"""get user email"""
def get_user_email(email):
    return User.query.get(email)

"""create a volume"""


"""return all volumes"""

"""get volume_id"""

"""get book_users id"""

"""create a new review"""

"""list all reviews for book"""
