import 'abstract_model.dart';
import 'coordinate.dart';
import 'dart:convert';

class Hotel extends IModel {
  String? name;
  double? starRating;
  String? guestRating;
  String? address;
  String? street;
  int? price;
  Coordinate? coordinate;
  String? image;
  String? features;

  Hotel(
      {int? id,
      this.name,
      this.starRating,
      this.guestRating,
      this.address,
      this.street,
      this.price,
      this.coordinate,
      // this.deals,
      this.image,
      this.features})
      : super(id);

  static Hotel fromJson(dynamic json) {
    var coordinate = json['coordinate'] != null
        ? Coordinate.fromJson(json['coordinate'])
        : null;
    return Hotel(
      id: json['id'],
      name: json['name'],
      starRating: json['starRating'],
      guestRating: json['guestrating'],
      address: json['address'],
      street: json['street'],
      image: json['imgURL'],
      price: 120,
      coordinate: coordinate,
    );
  }

  String toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['starRating'] = this.starRating;
    data['guestrating'] = this.guestRating;
    data['address'] = this.address;
    data['street'] = this.street;
    data['price'] = this.price;
    if (this.coordinate != null) {
      data['coordinate'] = this.coordinate!.toJson();
    }
    // if (this.deals != null) {
    //   data['deals'] = this.deals.toJson();
    // }
    data['imgURL'] = this.image;
    // if (this.features != null) {
    //   data['features'] = this.features.toJson();
    // }
    return json.encode(data);
  }

  String stringifyRatingExp() {
    double val = double.parse(guestRating!);
    if (val < 2.0)
      return "Terrible";
    else if (val >= 2.0 && val < 4.0)
      return "Bad";
    else if (val >= 4.0 && val < 6.0)
      return "Good";
    else if (val >= 6.0 && val < 8.0)
      return "Very Good";
    else
      return "Excellent";
  }
}
