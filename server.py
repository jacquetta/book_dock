from flask import (Flask, render_template, request, flash, session, redirect)
from model import db, Book_User, connect_to_db
import json
import crud
from flask_debugtoolbar import DebugToolbarExtension
from jinja2 import StrictUndefined

app = Flask(__name__)

app.debug = True
app.secret_key = "books2012"
app.jinja_env.undefined = StrictUndefined
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
@app.route('/volumes')
def book_list():
    volumes = crud.all_volumes();
    return render_template("/book_list.html", volumes=volumes)

"""VOLUME ROUTE"""
@app.route('/volumes/<volume_id>')
def book_details(volume_id):
    volume = crud.get_volume_id(volume_id)
    return render_template("/book_details.html", volume=volume)

"""ADD A BOOK ROUTE"""
@app.route('/add_book', methods=["POST"])
def create_list():
    user_id = session['key']
    volume_id = request.form.get('volume_id')
    bookuser_id = crud.check_bookuser(volume_id, user_id)

    volumes = crud.all_volumes()

    if bookuser_id:
        flash('Book already on list')
        return render_template('book_list.html', volumes=volumes)  
    else:
        crud.create_bookuser(volume_id, user_id)
        flash('Book Added!')
        return redirect('user_home')

@app.route('/profile')
def update_profile():
    user_id = session['key']
    user_profile = crud.get_user_id(user_id)
    return render_template('/profile.html', user_profile=user_profile)

@app.route('/current', methods=["POST"])
def move_book():
    user_id = session['key']
    volume_id = request.form.get('volume_id')
    bookuser_id = crud.bookuser(volume_id, user_id)
    # bookuser = crud.get_bookuser(bookuser_id)
    bookuser_id.reading = "true"
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











if __name__ == "__main__":
    connect_to_db(app)
    app.run(host="0.0.0.0", debug=True)