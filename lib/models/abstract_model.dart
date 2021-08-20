abstract class IModel {
  final int? id;

  IModel(this.id);

  Map<String, dynamic> toJson();
}
