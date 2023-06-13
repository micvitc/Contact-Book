from flask import Flask, request, jsonify 
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow 
from flask import Flask, request


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
   cabin_num= db.Column(db.String(100))


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
    cabin_num= marsh.auto_field()
author_schema = ContactSchema()

contact = Contact(id=1, name='John Doe', phone_num='1234567890', email='john@example.com', designation='Developer', description='Lorem ipsum', school='ABC School', cabin_num='AB2-301')
serialized_contact = author_schema.dump(contact)

@app.route('/contacts', methods=['GET'])
def get_contacts():
    contacts = Contact.query.all()
    contact_schema = ContactSchema(many=True)
    result = contact_schema.dump(contacts)
    return jsonify(result)

@app.route('/contacts/<int:id>', methods=['GET'])
def get_contacts_by_id(id):
    contact = Contact.query.filter(Contact.id==id).first()
    contact_schema = ContactSchema(many=False)
    result = contact_schema.dump(contact)
    return jsonify(result)


# @app.route('/contacts', methods=['GET'])
#def get_contacts():
    serialized_contact = author_schema.dump(contact)
    return jsonify(serialized_contact) 


@app.route('/contacts', methods=['POST'])
def add_contact():
    contacts = request.json  

    for contact_data in contacts:
        name = contact_data['name']
        email = contact_data['email']
        phone_num = contact_data['phone_num']
        designation = contact_data['designation']
        description = contact_data['description']
        school = contact_data['school'] 
        cabin_num= contact_data['cabin_num']

        new_contact = Contact(name=name, email=email, phone_num=phone_num, designation=designation, description=description, school=school, cabin_num=cabin_num)
        db.session.add(new_contact)

    db.session.commit()
    return jsonify({'message': 'Contacts added successfully'})


if __name__ == '__main__': 
    db.create_all()
    app.run(debug=True) 



