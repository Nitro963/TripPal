import 'abstract_model.dart';

class User implements IModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? profilePicture;
  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.profilePicture});

  static User fromJson(dynamic json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      profilePicture: json['profile_picture'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }

  @override
  int get hashCode => email.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && email == other.email;
  String get name => '$firstName $lastName';
}
