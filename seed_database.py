# from datetime import datetime
import os 
# from random import choice, randint
import crud
import model
import server
import json

os.system('dropdb tracker')
os.system('createdb tracker')
model.connect_to_db(server.app)
model.db.create_all()

with open("data/static_data.json") as v:
    volume_data = json.loads(v.read())


volumes_in_db = []
for volume in volume_data:
    volume_id, title, authors, genre, summary, published_date, page_count, img_links = (volume["volume_id"],volume["title"],volume["authors"],
        volume["genre"], volume["summary"], volume["published_date"], volume["page_count"], volume["img_links"])

    # published_date = datetime.strptime(volume["published_date", "%Y-%m"])

    add_volume = crud.create_volume(volume_id,title, authors, genre, summary, published_date, page_count, img_links)
    volumes_in_db.append(add_volume)


with open("data/users.json") as u:
    user_data = json.loads(u.read())

users_in_db = []
for user in user_data:
    full_name, email, password, book_goal, goal_date = (user["full_name"], user["email"], user["password"], user["book_goal"], user["goal_date"])
    add_user = crud.new_user(full_name, email, password, book_goal, goal_date)
    users_in_db.append(add_user)
    