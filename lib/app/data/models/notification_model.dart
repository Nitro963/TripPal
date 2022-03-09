import 'dart:convert' as convert;

import 'app_model.dart';

class NotificationModel extends IModel {
  NotificationModel({int? id}) : super(id: id);

  factory NotificationModel.fromPayload(String payload) {
    var json = convert.json.decode(payload);
    return NotificationModel.fromJson(json);
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(id: -1);
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
