from flask import Flask, request, jsonify 
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow 

app= Flask(__name__)
marsh = Marshmallow(app)
app.app_context().push()
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///contacts.sqlite3' 
db = SQLAlchemy(app)


class Contact(db.Model):
   id = db.Column('contact_id', db.Integer, primary_key = True)
   name = db.Column(db.String(100))
   phone_num = db.Column(db.String(50))  
   email = db.Column(db.String(200))
   designation = db.Column(db.String(10))  
   description = db.Column(db.String(400)) 
   school = db.Column(db.String(100))

class ContactSchema(marsh.SQLAlchemyAutoSchema):
    class Meta:
     model = Contact
    id = marsh.auto_field()
    name = marsh.auto_field()
    phone_num = marsh.auto_field()
    email = marsh.auto_field()
    designation = marsh.auto_field() 
    description= marsh.auto_field()
    school = marsh.auto_field() 
author_schema = ContactSchema()



@app.route('/contacts', methods=['GET'])
def get_contacts():
    contacts = Contact.query.all()
    contact_schema = ContactSchema(many=True)
    result = contact_schema.dump(contacts)
    return jsonify(result) 

@app.route('/contacts', methods=['POST'])
def add_contact():
    name = request.json['name']
    email = request.json['email'] 
    phone_num = request.json['phone_num'] 
    designation = request.json['designation'] 
    description= request.json['description'] 
    school = request.json['school']  

    new_contact = Contact(name=name, email=email)
    db.session.add(new_contact)
    db.session.commit()
    return jsonify({'message': 'Contact added successfully'}) 

if __name__ == '__main__':
    app.run(debug=True)





if __name__ == '__main__':
    db.create_all()
    app.run(debug=True)
