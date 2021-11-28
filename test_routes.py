from unittest import TestCase

from werkzeug import test

from model import db, connect_to_db, test_data
# from flask import session
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

        result = self.client.get("/user_home")
        self.assertIn(b"Welcome to Book Dock!", result.data)
    
    def test_not_logged_in(self):
        result = self.client.get('/', follow_redirects=True)
        self.assertIn(b'Book Dock', result.data)



class LandingPageTest(TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        self.client = app.test_client()

    def test_landing_page(self):
        result = self.client.get('/')
        self.assertEqual(result.status_code, 200)
        self.assertIn(b'Book Dock', result.data)

class SignInTest(TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        self.client = app.test_client()

    def test_signin_form(self):
        result = self.client.post('/signin', data={'email': 'bw@email.com', 'password': 'Password123'}, follow_redirects=True)
        self.assertIn(b'Welcome to Book Dock', result.data)


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