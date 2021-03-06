"""CRUD"""

from model import db, User, Book_User, Volume, Review, connect_to_db
from datetime import datetime
from sqlalchemy import delete

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


"""get user_id"""
def get_user_id(user_id):
    return User.query.get(user_id)

"""get user email"""
def get_user_email(email):
    return User.query.filter(User.email == email).first()

"""create a volume"""
def create_volume(volume_id, title, authors, genre, summary, published_date, page_count, img_links):
    volume = Volume(volume_id=volume_id,title=title, authors=authors, genre=genre, summary=summary, published_date=published_date, page_count=page_count, img_links=img_links)

    db.session.add(volume)
    db.session.commit()
    return volume

"""return all volumes"""
def all_volumes():
    return Volume.query.all()

"""get volume_id"""
def get_volume_id(volume_id):
    return Volume.query.get(volume_id)

"""create book_user"""
def create_bookuser(volume_id, user_id):
    book_user = Book_User(volume_id=volume_id, user_id=user_id)

    db.session.add(book_user)
    db.session.commit()
    return book_user


# def delete_bookuser(bookuser_id):
#     bookuser = Book_User.query.get(bookuser_id)
#     # bookuser = Book_User.query.filter(bookuserId == bookuser_id).delete()
#     # db.session.commit
#     return bookuser

"""get book_users id"""
def get_bookuser(bookuser_id):
    return Book_User.query.get(bookuser_id)

def bookuser(volume_id, user_id):
    return Book_User.query.filter((Book_User.volume_id == volume_id) & (Book_User.user_id == user_id )).first()


def user_list(user_id):
    return Book_User.query.filter(Book_User.user_id == user_id).all()

"""check if user_id and volume_id share bookusers_id"""
def check_bookuser(volume_id, user_id):
    return Book_User.query.filter((Book_User.volume_id == volume_id) & (Book_User.user_id == user_id )).all()

def update_reading(bookuser):
    bookuser = Book_User.query.filter(Book_User.reading)
    return bookuser

"""create a new review"""
def create_review(title, review_title, review, published, user_id, volume_id):
    user_review = Review(title=title, review_title=review_title, review=review, published=published, user_id=user_id, volume_id=volume_id)

    db.session.add(user_review)
    db.session.commit()
    return user_review

def check_reviews(volume_id, user_id):
    return Review.query.filter((Review.volume_id == volume_id) & (Review.user_id == user_id)).first()

def get_review_id(review_id):
    return Review.query.get(review_id)

def review(volume_id, user_id):
   Review.query.filter((Review.volume_id == volume_id) & (Review.user_id == user_id )).first()
   
"""list all reviews for book"""
# change query to filter by book
def book_reviews(volume_id):
    return Review.query.filter(Review.volume_id == volume_id).all()