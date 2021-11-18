from flask import (Flask, render_template, request, flash, session, redirect)
from model import db, Book_User, connect_to_db
import json
import crud
import os
import requests
from pprint import pformat, pprint
from sys import argv
from flask_debugtoolbar import DebugToolbarExtension
from jinja2 import StrictUndefined

app = Flask(__name__)

app.debug = True
app.secret_key = "books2012"
app.jinja_env.undefined = StrictUndefined

API_KEY = os.environ['API_KEY']

# toolbar = DebugToolbarExtension(app)
# toolbar.init_app(app)
"""HOMEPAGE ROUTE"""
@app.route('/')
def homepage():
    return render_template('/homepage.html')

"""SIGN UP ROUTE"""
@app.route('/signup', methods=["POST"])
def sign_up():
    full_name = request.form.get('full_name')
    email = request.form.get('email')
    password = request.form.get('password')
    book_goal = request.form.get('book_goal')
    goal_date = request.form.get('goal_date')
    userid = request.args.get('user_id')

    user_email = crud.get_user_email(email)
    # user_id = crud.get_user_id(userid)

    if user_email:
        flash('User email already exists. Please try again!')
        return render_template('signup_form.html')
    else:
        crud.new_user(full_name, email, password, book_goal, goal_date)
        flash('Account created!')
        return render_template('user_home.html')

"""SIGN IN ROUTE"""
@app.route('/signin', methods=["POST"])
def sign_in():
    email = request.form.get('email')
    password = request.form.get('password')
    user = crud.login(email, password)

    if user:
        session['key'] = user.user_id
        flash('Signed In') 
        return redirect('/user_home')
    else: 
        # https://flask.palletsprojects.com/en/1.1.x/patterns/flashing/
        # https://pythonise.com/series/learning-flask/flask-message-flashing
        flash('Invalid email or password')
        return render_template('homepage.html')

"""SIGN UP FORM ROUTE"""
@app.route('/signup_form')
def signup_form():
    return render_template('/signup_form.html')

@app.route('/profile')
def update_profile():
    user_id = session['key']
    user_profile = crud.get_user_id(user_id)
    # Need to update database if user changes profile information
    return render_template('/profile.html', user_profile=user_profile)


"""USER HOME ROUTE"""
@app.route('/user_home')
def user_home():
    user_id = session['key']
    user = crud.get_user_id(user_id)
    bookuser = crud.user_list(user_id)
    volumes = crud.all_volumes()
    
    if 'key' in session:
        return render_template('/user_home.html', bookuser=bookuser,volumes=volumes, user=user)
    else:
        return redirect('/homepage')
    
"""LOG OUT ROUTE"""
@app.route('/log_out')
def log_out():
    # work on log out 
    if 'key' in session:
        session.pop('key')
    return render_template('/homepage.html')

"""VOLUMES ROUTE"""
@app.route('/search')
def book_search():
    return render_template("/search.html",)


"""ADD A BOOK ROUTE"""
@app.route('/add_book', methods=["POST"])
def create_list():
    user_id = session['key']
    volume_id = request.form.get('volume_id')
    title = request.form.get('volume_title')
    authors = request.form.get('volume_authors')
    genre = request.form.get('volume_genre')
    summary = request.form.get('volume_description')
    published_date = request.form.get('volume_publishedDate')
    page_count = request.form.get('volume_pageCount')
    img_links = request.form.get('volume_imageLinks')

    bookuser_id = crud.check_bookuser(volume_id, user_id)
    bookvolume_id = crud.get_volume_id(volume_id)

    # NEED TO FIX IF USER TRIES TO ADD BOOK TO THEIR LIST AGAIN
    # RIGHT NOW IT TAKES USERS BACK TO SEARCH PAGE NOT SEARCH RESULTS(WHICH RESULTS IN ERROR)
    if bookuser_id:
    #    flash('Book already on list')
       return 'Book already on list'
    #    render_template('search.html')
       
    else:
        if bookvolume_id:
            crud.create_bookuser(volume_id, user_id)
            flash('Book Added!')
            return redirect('user_home')
        else:
            crud.create_volume(volume_id, title, authors, genre, summary, published_date, page_count, img_links)
            crud.create_bookuser(volume_id, user_id)
            flash('Book Added!')
            return redirect('user_home')


@app.route('/current', methods=["POST"])
def move_current():
    user_id = session['key']
    volume_id = request.form.get('volume_id')
    bookuser_id = crud.bookuser(volume_id, user_id)
    # bookuser = crud.get_bookuser(bookuser_id)
    bookuser_id.reading = "true"
    bookuser_id.completed = "false"
    db.session.commit()
    return redirect('user_home')

@app.route('/completed', methods=["POST"])
def completed_book():
    user_id = session['key']
    volume_id = request.form.get('volume_id')
    bookuser_id = crud.bookuser(volume_id, user_id)

    bookuser_id.completed = "true"
    db.session.commit()
    return redirect('user_home')


@app.route('/to_read', methods=["POST"])
def move_toread():
    user_id = session['key']
    volume_id = request.form.get('volume_id')
    bookuser_id = crud.bookuser(volume_id, user_id)

    bookuser_id.reading = "false"
    db.session.commit()
    return redirect('user_home')

# SEARCH THROUGH GOOGLE BOOKS USING API
@app.route('/search_books')
def book_request():
    q = request.args.get('q', '')

    url = 'https://www.googleapis.com/books/v1/volumes'
    payload = {'key': API_KEY, 'q': q ,' maxResult': 20 }

    res = requests.get(url, params=payload)
    data = res.json()
    # print(data)
    volumes = data['items']
    return render_template('/search_results.html', pformat=pformat, data=data, results=volumes)

"""VOLUME ROUTE"""
@app.route('/volumes/<volumeId>')
def book_details(volumeId):
    # volume = crud.get_volume_id(volume_id)
    # return render_template("/book_details.html", volume=volume)
    url = f'https://www.googleapis.com/books/v1/volumes/{volumeId}'
    payload = {'key': API_KEY}

    res = requests.get(url, params=payload)
    volume = res.json()
  
    print(volume)
    return render_template('/book_details.html', volume=volume)


@app.route('/delete_bookuser', methods=["GET"])
def delete_book():
    user_id = session['key']
    bookuser_id = request.args.get("bookuser_id")
    bookuser = crud.delete_bookuser(bookuser_id)
    flash ('Book deleted from list')
    return redirect('/user_home')

# REVIEWS

@app.route('/review_form')
def review_form():
    return render_template('/review_form.html')

@app.route('/add_review', methods=["POST"])
def add_review():
    volume_title = request.form.get('volumeTitle')
    review_title = request.form.get('reviewTitle')
    review_post = request.form.get('reviewPost')
    user_id = session['key']
    volume_id = request.form.get('volume_id')

if __name__ == "__main__":
    connect_to_db(app)
    app.run(host="0.0.0.0", debug=True)