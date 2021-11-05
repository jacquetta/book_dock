from flask import (Flask, render_template, request, flash, session, redirect)
from model import connect_to_db
import crud
from flask_debugtoolbar import DebugToolbarExtension
from jinja2 import StrictUndefined

app = Flask(__name__)

app.debug = True
app.secret_key = "books2012"
app.jinja_env.undefined = StrictUndefined
# toolbar = DebugToolbarExtension(app)
# toolbar.init_app(app)

@app.route('/')
def homepage():
    return render_template('/homepage.html')

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
        flash('Cannot create account. Please try again!')
        return render_template('signup_form.html')
    else:
        crud.new_user(full_name, email, password, book_goal, goal_date)
        flash('Account created!')
        return render_template('user_home.html')

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
        flash('Please re-enter email and password')
        return render_template('homepage.html')

@app.route('/user_home')
def user_home():
    if 'key' in session:
        return render_template('/user_home.html')

@app.route('/log_out')
def log_out():
    # work on log out 
    if 'key' in session:
        session.pop('key')
    return render_template('/homepage.html')

@app.route('/book_list')
def book_list():
    return render_template('/book_list.html')

@app.route('/signup_form')
def signup_form():
    
    return render_template('/signup_form.html')


if __name__ == "__main__":
    connect_to_db(app)
    app.run(host="0.0.0.0", debug=True)