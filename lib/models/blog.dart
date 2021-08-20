import 'package:trip_pal_null_safe/models/tag.dart';
import 'package:trip_pal_null_safe/models/user.dart';

import 'abstract_model.dart';

class Blog extends IModel {
  String? title;
  String? image;
  String? blogText;
  String? date;
  List<Tag> tags;
  User? user;

  Blog(
      {id,
      this.title,
      this.image,
      this.blogText,
      this.date,
      this.tags = const [],
      this.user})
      : super(id);

  static Blog fromJson(dynamic json) {
    return Blog(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      blogText: json['blog_text'],
      date: json['date'],
      tags: json['tags'] != null
          ? (json['tags'] as List).map(Tag.fromJson).toList()
          : [],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['blog_text'] = this.blogText;
    data['date'] = this.date;
    data['tags'] = this.tags.map((v) => v.toJson()).toList();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
