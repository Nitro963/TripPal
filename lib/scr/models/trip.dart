import 'Day.dart';

class Trip {
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
      required this.days});
}
