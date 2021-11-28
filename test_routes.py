from unittest import TestCase

from werkzeug import test

from model import db, connect_to_db, test_data
from flask import session
from server import app
from flask_sqlalchemy import SQLAlchemy
app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql:///testtracker"
db = SQLAlchemy(app)



class LoggedInTest(TestCase):

    def setUp(self):
        app.config['TESTING'] = True
        app.config['SECRET_KEY'] = 'key'
        self.client = app.test_client()

        with self.client as c:
            with c.session_transaction() as session:
                session['key'] = 22
    
    def test_user_home(self):
        """testing if user is logged in"""
        result = self.client.get("/user_home")
        self.assertIn(b"Welcome to Book Dock!", result.data)

    def test_book_list(self):
        """test search route"""
        result = self.client.get('/search')
        self.assertIn(b'search', result.data)

    def test_not_logged_in(self):
        """testing for user not logged in"""
        result = self.client.get('/', follow_redirects=True)
        self.assertIn(b'Book Dock', result.data)


class LandingPageTest(TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        self.client = app.test_client()

    def test_landing_page(self):
        """testing for landing page"""
        result = self.client.get('/')
        self.assertEqual(result.status_code, 200)
        self.assertIn(b'Book Dock', result.data)

class SignInTest(TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        self.client = app.test_client()

    def test_signin_form(self):
        """testing sign in form"""
        with self.client as c:
            result = c.post('/signin', data={'email': 'bw@email.com', 'password': 'Password123'}, follow_redirects=True)
        self.assertIn(b'Welcome to Book Dock', result.data)


    def test_logout(self):
        """testing log out route"""

        with self.client as c:
            with c.session_transaction() as sess:
                sess['key'] = '22'
            
            result = self.client.get('/log_out', follow_redirects=True)

            self.assertNotIn(b'user_id', session)
            self.assertIn(b'Sign In', result.data)


class AppTest(TestCase):
    def setUp(self):
        self.client = app.test_client()
        app.config['TESTING'] = True
        connect_to_db(app, "postgresql:///testtracker")

        # Create tables and add sample data
        db.create_all()
        test_data()

    def tearDown(self):
        """Do at end of every test."""

        db.session.remove()
        db.drop_all()
        db.engine.dispose()
    







if __name__ == '__main__':
    import unittest
    unittest.main()