import pymongo

class AppDatabase:
    def __init__(self):
        try:
            client = pymongo.MongoClient("mongodb://localhost:27017/")
            print("Connection Succesful")
        except: 
            print("Connection Unsuccessful")

        app_data = client["Bar Rush"]
        user_data = app_data["Users"]
        bar_data = app_data["Bars"]

app = AppDatabase()