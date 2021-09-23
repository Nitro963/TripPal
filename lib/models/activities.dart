import 'package:trip_pal_null_safe/models/hotel.dart';

import 'abstract_model.dart';

class Activity extends IModel {
  int? day;
  int? trip;
  Place? place;

  Activity({int? id, this.day, this.trip, this.place}) : super(id);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'day': this.day,
      'trip': this.trip,
      'place': this.place?.toJson(),
    };
  }

  static Activity fromJson(dynamic json) {
    return Activity(
      id: json['id'],
      day: json['day'],
      trip: json['trip'],
      place: json['place'] != null ? Place.fromJson(json['place']) : null,
    );
  }
}
