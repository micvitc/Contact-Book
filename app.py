from flask import Flask, request, jsonify 
from flask_sqlalchemy import SQLAlchemy 

app= Flask(__name__)
app.app_context().push()
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///contacts.sqlite3' 
db = SQLAlchemy(app)
class Contact(db.Model):
   id = db.Column('contact_id', db.Integer, primary_key = True)
   name = db.Column(db.String(100))
   phone_num = db.Column(db.String(50))  
   email = db.Column(db.String(200))
   dsignation = db.Column(db.String(10))  
   description = db.Column(db.String(400)) 
   school = db.Column(db.String(100))


if __name__ == '__main__':
    db.create_all()
    app.run(debug=True)
