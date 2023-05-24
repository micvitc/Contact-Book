from flask import Flask

from flask_pymongo import PyMongo

from bson.json_util import dumps

from bson.objectid import ObjectId

from flask import jsonify,request

from werkzeug.security import generate_password_hash,check_password_hash

app=Flask(__name__)

app.secret_key="secretkey"

app.config['MONGO_URI']="mongodb://localhost:27017/ContactBook"

mongo = PyMongo(app)

@app.route('/add',methods=['POST'])
def add_user():
    _json=request.json
    _id=_json['user_id']
    _name=_json['user_name']
    _email=_json['user_email']
    _phone=_json['PhoneNo']
    _address=_json['user_address']

    if _id and _name and _email and _phone and _address and request.method=='POST':
        id = mongo.db.User.insert({'user_id':_id,'user_name':_name,'user_email':_email,'PhoneNo':_phone,'user_address':_address})

        resp=jsonify("User added succesfully")

        resp.status_code = 200

        return resp
    else:
        return not_found()
    
def add_login():
    _json=request.json
    _lid=_json['login_id']
    _lusername=_json['login_username']
    _lpwd=_json['login_password']

    if _lid and _lusername and _lpwd and request.method=='POST':

        _hashed_password=generate_password_hash(_lpwd)

        id = mongo.db.Login.insert({'login_id':_lid,'login_username':_lusername,'login_password':_lpwd})
        resp=jsonify("Login added succesfully")
        resp.status_code=200
        return resp
    else:
        return not_found()

def add_roles():
    _json=request.json
    _rid=_json['role_id']
    _rname=_json['role_name']
    _rdesc=_json['role_description']

    if _rid and _rname and _rdesc and request.method=='POST':
        id = mongo.db.Roles.insert({'role_id':_rid,'role_name':_rname,'role_description':_rdesc})
        resp=jsonify("Role added succesfully")
        resp.status_code=200
        return resp
    else:
        return not_found()
    
def add_Contact_details():
    _json=request.json
    _cdid=_json['cd_id']
    _cdphone=_json['cd_Phone']
    _cdname=_json['cd_name']
    _cdemail=_json['cd_email']
    _cddesc=_json['cd_description']

    if _cdid and _cdphone and _cdname and _cdemail and _cddesc and request.method=='POST':
        id = mongo.db.Contact_Details.insert({'cd_id':_cdid,'cd_Phone':_cdphone,'cd_name':_cdname,'cd_email':_cdemail,'cd_description':_cddesc})

        resp=jsonify("Contact Detail added succesfully")
        resp.status_code=200
        return resp
    else:
        return not_found()

def add_address():
    _json=request.json
    _lmark=_json['landmark']
    _city=_json['city']
    _place=_json['place']
    _houseno=_json['houseno']

    if _lmark and _city and _place and _houseno and request.method=='POST':
        id =mongo.db.Address.insert({'landmark':_lmark,'city':_city,'place':_place,'houseno':_houseno})

        resp=jsonify("Address added succesfully")
        resp.status_code=200
        return resp
    else:
        return not_found()

@app.route('/users')
def users():
    users=mongo.db.ContactBook.find()
    resp=dumps(users)
    return resp

@app.route('/users/<id>')
def user(id):
    user=mongo.db.User.find_one({'_id':ObjectId(id)})
    resp=dumps(user)
    return resp

@app.route('/delete/<id>',methods=['DELETE'])
def delete_user(id):
    mongo.db.user.delete_one({'id':ObjectId(id)})
    resp=jsonify("User deleted succesfully")

    resp.status_code=200

    return resp
    
@app.route('/update/<id>',methods=['PUT'])
def update_user(id):
    _id=id
    _json=request.json
    _name=_json['user_name']
    _email=_json['user_email']
    _phone=_json['PhoneNo']
    _address=_json['user_address']

    if _id and _name and _email and _phone and _address and request.method=='PUT':

        resp=jsonify("User updated succesfully")
        resp.status_code=200
        return resp
    else:
        return not_found()

@app.errorhandler(404)
def not_found(error=None):
    message ={
        'status':404,
        'message' :'Not found' + request.url
    }
    resp=jsonify(message)

    resp.status_code =404
    return resp

if __name__=="__main__":
    app.run(debug=True)
