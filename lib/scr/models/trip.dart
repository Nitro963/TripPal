import 'Day.dart';

class Trip {
  String type;
  String city;
  String country;
  String details;
  List<Day> days;
  Trip({this.type, this.details, this.city, this.country, this.days});
}
