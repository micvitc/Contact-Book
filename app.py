from flask import Flask, request, jsonify
from pymongo import MongoClient

app = Flask('contact_book_app')

# Connect to MongoDB
client = MongoClient('mongodb://localhost:27017/' or 'mongodb://0.0.0.0:27017/',connect=False)
db = client['contact_book']
collection = db['contacts']


@app.route('/contacts', methods=['POST'])

def create_contact():
    # Retrieve contact data from the request
    data = request.get_json()
    name = data['name']
    phone = data['phone']
    email = data['email']
    designation = data['designation']
    school = data['school']

    # Create a new contact document
    contact = {'name': name, 'phone': phone, 'email': email, 'designation': designation, 'school': school}

    # Insert the contact document into the MongoDB collection
    contact_id = collection.insert_one(contact).inserted_id

    return jsonify({'message': 'Contact created successfully', 'contact_id': str(contact_id)})

@app.route('/contacts', methods=['GET'])
def get_all_contacts():
    # Retrieve all contacts from the MongoDB collection
    contacts = list(collection.find({}, {'_id': 0}))

    return jsonify(contacts)

@app.route('/contacts/<contact_id>', methods=['GET'])
def get_contact(contact_id):
    # Retrieve a specific contact by its ID from the MongoDB collection
    contact = collection.find_one({'_id': contact_id}, {'_id': 0})

    if contact:
        return jsonify(contact)
    else:
        return jsonify({'message': 'Contact not found'})

if __name__ == '__main__':
    app.run(debug=True)