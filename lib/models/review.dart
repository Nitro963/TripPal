import 'dart:convert';

import 'package:trip_pal_null_safe/models/abstract_model.dart';

class Review extends IModel {
  final String text;
  final int userID;
  final int placeID;

  Review(
      {int? id,
      required this.text,
      required this.userID,
      required this.placeID})
      : super(id);

  @override
  String toJson() {
    return json
        .encode({'id': id, 'userId': id, 'placeID': placeID, 'text': text});
  }

  static Review fromJson(dynamic json) {
    return Review(
      id: json['id'],
      text: json['text'],
      userID: json['user_id'],
      placeID: json['place_id'],
    );
  }
}
