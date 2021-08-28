import 'abstract_model.dart';
import 'package:intl/intl.dart' as intl;

class User extends IModel {
  // int id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  DateTime? birthDate;
  String? profilePicture;
  String? gender;

  User(
      {id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.profilePicture,
      this.birthDate,
      this.gender}):super(id);
  static final formatter = intl.DateFormat('yyyy-MM-dd');
  static User fromJson(dynamic json) {
    return User(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        profilePicture: json['profile_picture'],
        gender: json['gender'],
        birthDate: json['birthday'] != null
            ? formatter.parse(json['birthday']!)
            : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['birthday'] = birthDate != null ? formatter.format(birthDate!) : null;
    data['gender'] = this.gender;
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
