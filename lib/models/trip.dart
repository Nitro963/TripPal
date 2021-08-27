import 'package:trip_pal_null_safe/models/user.dart';
import 'package:intl/intl.dart' as intl;
import 'abstract_model.dart';
import 'day.dart';
import 'dart:convert' as conv;

class Trip extends IModel {
  User user;
  DateTime startDate;
  List<Day> days;

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
    var days = (json['days'] as List).map((element) {
      try {
        var id = element as int;
        return Day.fromJson({'id': id});
      } catch (e) {
        return Day.fromJson(element as Map<String, dynamic>);
      }
    }).toList();
    return Trip(
      user: User.fromJson(json['user']),
      startDate: intl.DateFormat('yyyy-mm-dd').parse(json['start_date']),
      days: days,
    );
  }
}
