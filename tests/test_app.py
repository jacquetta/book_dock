from unittest import TestCase
from server import app
from model import db, User, Book_User, Volume, Review, connect_to_db
from flask import session

class BookDeck_Test(TestCase):
    """Flask Testing"""
    def setUp(self):
        # this will get flask test client 
        self.client = app.test_client()
        # this shows flask errors
        app.config['TESTING'] = True

    def test_homepage(self):
        """testing landing page"""

        result = self.client.get("/")
        self.assertIn(b"Home", result.data)

    def test_login(self):
        result = self.client.post("/signin", 
                                    data ={"user_id": 'fflintsone@email.com', "password": 'Password5'},
                                    follow_redirects = True)
        self.assertIn(b"You are logged in", result.data)

class FlaskTestDatabase(TestCase):
    
    def setUp(self):
        self.client = app.test_client()
        app.config['TESTING'] = True

        connect_to_db(app, "postgresql:///testtracker")

        # create tables and add test data
        db.create_all
        test_data()
    
    def tearDown(self):
        """run at the end of each test"""
        db.session.remove()
        db.drop_all()
        db.engine.dispose()

    def test_search_home(self):
        result = self.client.get("/search")
        self.assertIn(b"Search", result.data)

    
class FlaskTestLogin(TestCase):
    """Flask tests user logged into session"""

    def setUp(self):
        
        app.config['TESTING'] = True
        app.config['SECRET_KEY'] = 'key'
        self.client = app.test_client()

        with self.client as c:
            with c.session_transaction() as session:
                session['user_id'] = 22

    def test_user_home(self):
         result = self.client.get('/user_home')
         self.assertIn(b"Logged In User Home", result.data)

class FlaskSessionLogOut(TestCase):

    def setUp(self):

        app.config['TESTING'] = True
        self.client = app.test_client()

    def test_user_page(self):
        result = self.client.get("/user_home", follows_redirect=True)
        self.assertNotIn(b"Logged In", result.data)
        self.assertIn(b"You are not logged in", result.data)




if __name__ == "__main__":
    import unittest

    unittest.main()