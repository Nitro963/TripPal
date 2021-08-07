import 'dart:convert';

import 'abstract_model.dart';

class User implements IModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? createdAt;
  String? updatedAt;
  String? emailVerifiedAt;
  String? profilePicture;
  User({this.id, this.name, this.email, this.password, this.profilePicture});

  static User fromJson(dynamic json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profilePicture: json['image'],
    );
  }

  // static User fromAuthJson(dynamic json) {
  //   return User(
  //     id: json['user']['id'],
  //     name: json['user']['name'],
  //     email: json['user']['email'],
  //     authToken: json['token'],
  //   );
  // }

  String toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    return json.encode(data);
  }
}
