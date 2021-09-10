import 'abstract_model.dart';

class Notification extends IModel {
  int? receiver;
  String? description;
  DateTime? pushedAt;
  String? status;
  String? resource;
  int? elementId;

  Notification(
      {int? id,
      this.receiver,
      this.description,
      this.pushedAt,
      this.status,
      this.resource,
      this.elementId})
      : super(id);

  static Notification fromJson(json) {
    return Notification(
      id: json['id'],
      receiver: json['receiver'],
      description: json['description'],
      pushedAt: json['pushed_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['pushed_at'] * 1000)
          : null,
      status: json['status'],
      resource: json['resource'],
      elementId: json['element_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['receiver'] = this.receiver;
    data['description'] = this.description;
    data['pushed_at'] = this.pushedAt;
    data['status'] = this.status;
    data['resource'] = this.resource;
    data['element_id'] = this.elementId;
    return data;
  }
}
