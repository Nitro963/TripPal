import 'abstract_model.dart';

class Activity extends IModel {
  int? day;
  int? trip;
  int? place;
  Activity({int? id, this.day, this.trip, this.place}) : super(id);

  @override
  Map<String, dynamic> toJson() {
    return {
      'day': this.day,
      'trip': this.trip,
      'place': this.place,
    };
  }

  static Activity fromJson(dynamic json) {
    return Activity(
      day: json['day'],
      trip: json['trip'],
      place: json['place'],
    );
  }
}
