# from datetime import datetime
# import os 
# from random import choice, randint
# import crud
# import model
# import server
# import json

# model.connect_to_db(server.app)
# model.db.create_all()

# with open("data/volumes.json") as v:
#     volume_data = json.loads(v.read())


# volumes_in_db = []
# for volume in volume_data:
#     title, authors, genre, summary, published_date, page_count, img_links = (volume["title"],volume["authors"],
#         volume["genre"], volume["summary"], volume["published_date"], volume["page_count"], volume["img_links"])

#     # published_date = datetime.strptime(volume["published_date", "%Y-%m"])

#     add_volume = crud.create_volume(title, authors, genre, summary, published_date, page_count, img_links)
#     volumes_in_db.append(add_volume)