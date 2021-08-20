import 'abstract_model.dart';

class Tag extends IModel {
  String? name;
  String? description;
  String? image;
  int? blogCount;

  Tag({int? id, this.name, this.description, this.image, this.blogCount})
      : super(id);

  static Tag fromJson(dynamic json) {
    return Tag(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      blogCount: json['blog_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['blog_count'] = this.blogCount;
    return data;
  }
}
