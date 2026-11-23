import 'package:trip_pal_null_safe/models/hotel.dart';
import 'abstract_model.dart';

class Activity extends IModel {
  int? day;
  // position of the activity inside its day
  int? index;
  Place? place;
  Activity({int? id, this.day, this.index, this.place}) : super(id);

  @override
  Map<String, dynamic> toJson() {
    // the backend expects the place primary key, not the nested object
    return {
      'id': this.id,
      'day': this.day,
      'index': this.index,
      'place': this.place?.id,
    };
  }

  static Activity fromJson(dynamic json) {
    return Activity(
      id: json['id'],
      day: json['day'],
      index: json['index'],
      place: json['place'] != null ? Place.fromJson(json['place']) : null,
    );
  }
}
