import 'package:trip_pal_null_safe/models/user.dart';
import 'package:intl/intl.dart' as intl;
import 'abstract_model.dart';
import 'day.dart';
import 'dart:convert' as conv;

class Trip extends IModel {
  User user;
  DateTime startDate;
  List<int> days;

  Trip({required this.user, required this.startDate, required this.days})
      : super(0);

  @override
  Map<String, dynamic> toJson() {
    return {
      'user': this.user.toJson(),
      'days': this.days,
      'start_date': intl.DateFormat("yyyy-mmmm-dd").format(this.startDate),
    };
  }

  static Trip fromJson(dynamic json) {
    return Trip(
      user: User.fromJson(json['user']),
      startDate: intl.DateFormat('yyyy-mm-dd').parse(json['start_date']),
      days: json['days'] as List<int>,
    );
  }
}
