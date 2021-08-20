import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/models/user.dart';

class Review extends IModel {
  final User? user;
  final int? place;
  final String? date;
  final String? reviewText;
  final double? overallRating;

  Review(
      {id,
      this.user,
      this.place,
      this.date,
      this.reviewText,
      this.overallRating})
      : super(id);

  static Review fromJson(dynamic json) {
    return Review(
      id: json['id'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      place: json['place'],
      date: json['date'],
      reviewText: json['review_text'],
      overallRating: double.parse(json['overall_rating']?.toString() ?? '0'),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user?.toJson();
    data['place'] = this.place;
    data['date'] = this.date;
    data['review_text'] = this.reviewText;
    data['overall_rating'] = this.overallRating;
    return data;
  }
}
