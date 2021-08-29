import 'package:trip_pal_null_safe/models/property.dart';

import 'abstract_model.dart';

class Place extends IModel {
  final String? name;
  final String? description;
  final double? latitude;
  final double? longitude;
  final String? address;
  final double? distance;
  final String? image;
  final String? cityName;
  final double? guestRating;
  final List<Property> properties;
  final Map<String, dynamic> ratingStat;
  final int? price;
  final int? type;
  final List<Place> similarPlaces;
  Place(
      {id,
      this.name,
      this.description,
      this.latitude,
      this.longitude,
      this.address,
      this.distance,
      this.image,
      this.cityName,
      this.guestRating,
      this.properties = const [],
      this.ratingStat = const {},
      this.price,
      this.type,
      this.similarPlaces = const []})
      : super(id);

  static Place fromJson(dynamic json) {
    return Place(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        address: json['address'],
        distance: json['distance'],
        image: json['image'],
        cityName: json['city_name'],
        guestRating: json['guest_rating'],
        properties: json['properties'] != null
            ? (json['properties'] as List).map(Property.fromJson).toList()
            : [],
        ratingStat: json['rating_stat'] != null ? json['rating_stat'] : {},
        price: json['price'],
        type: json['type'],
        similarPlaces: json['similar_places'] != null
            ? (json['similar_places'] as List).map(fromJson).toList()
            : []);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['distance'] = this.distance;
    data['image'] = this.image;
    data['city_name'] = this.cityName;
    data['guest_rating'] = this.guestRating;
    data['properties'] = this.properties.map((v) => v.toJson()).toList();
    data['rating_stat'] = this.ratingStat;
    data['price'] = this.price;
    data['type'] = this.type;
    return data;
  }

  int get totalRatings {
    int sum = 0;
    ratingStat.forEach((key, value) {
      sum += value as int;
    });
    return sum;
  }
}
