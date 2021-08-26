import 'package:trip_pal_null_safe/models/abstract_model.dart';

import 'activities.dart';

class Day extends IModel {
  int? dayIndex;
  int? tripIndex;
  List<Activity>? activities;
  Day({required this.dayIndex, required this.tripIndex,required this.activities}):super(0);

  @override
  Map<String, dynamic> toJson() {
    return {
      'day_index':this.dayIndex!,
      'trip':this.tripIndex!,
      'activities':this.activities!.map((activity)=>activity.toJson()).toList(),
    };
  }
  static Day fromJson(Map<String,dynamic> json){
    return Day(
      dayIndex: json['day_index']! as int,
      tripIndex: json['trip']!as int,
      activities: json['activities'] != null
          ? (json['activities'] as List).map(Activity.fromJson).toList() 
          : [],    );

  }
}
