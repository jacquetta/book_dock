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

"""get all users"""

"""get user_id"""

"""get user email"""

"""create a volume"""


"""return all volumes"""

"""get volume_id"""

"""get book_users id"""

"""create a new review"""

"""list all reviews for book"""
