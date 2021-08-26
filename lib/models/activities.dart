import 'abstract_model.dart';

class Activity extends IModel{
  int day;
  int trip;
  int place;
  Activity({required this.day, required this.trip, required this.place}):super(0);

  @override
  Map<String, dynamic> toJson() {
    return {
      'day':this.day,
      'trip':this.trip,
      'place':this.place,
    };
  }
  @override
  static Activity fromJson(dynamic json){
    return Activity (
      day:json['day'],
      trip:json['trip'],
      place:json['place'],

    );
  }
}
