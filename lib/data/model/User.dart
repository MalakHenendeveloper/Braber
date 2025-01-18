import 'dart:convert';

class UserModel {
  final String? id;
  final String? email;
  final String? name;


  UserModel({this.id, this.email, this.name});
  UserModel.fromjson(Map<String, dynamic>json):this(
  id: json['id'],
  email: json['email'],
  name: json ['name']
  );
  Map<String, dynamic>tojson(){
    return{
      'id':id,
      'email':email,
      'name':name
    };
  }
}
