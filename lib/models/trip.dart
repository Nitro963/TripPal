import 'abstract_model.dart';
import 'day.dart';

class Trip extends IModel {
  String type;
  String city;
  String country;
  String details;
  List<Day> days;

  Trip(
      {required this.type,
      required this.details,
      required this.city,
      required this.country,
      required this.days})
      : super(0);

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'city': city,
      'country': country,
      'days': days,
      'details': details
    };
  }

  static Trip fromJson(dynamic json) {
    return Trip(
      type: json['type'],
      city: json['city'],
      country: json['country'],
      details: json['details'],
      days: json['days'],
    );
  }
}
