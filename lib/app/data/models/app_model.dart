abstract class IModel {
  int? id;
  IModel({this.id});

  Map<String, dynamic> toJson();
}
