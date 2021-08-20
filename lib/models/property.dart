import 'abstract_model.dart';

class Property extends IModel {
  String? name;
  String? description;

  Property({id, this.name, this.description}) : super(id);

  static Property fromJson(dynamic json) {
    return Property(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
