import 'coordinate.dart';

class Place2 {
  String id;
  String name;
  int guestRating;
  String? kinds;
  double distance;
  Coordinate? coordinate;

  static Map<String, Place2> _cache = <String, Place2>{};

  factory Place2(String id, String name, int guestRating, String kinds,
      double distance, Coordinate coordinate) {
    if (_cache.containsKey(id)) {
      return _cache[id]!;
    } else {
      final place =
          Place2._internal(id, name, guestRating, kinds, distance, coordinate);
      _cache[id] = place;
      return place;
    }
  }

  factory Place2.fromJson(Map<String, dynamic> json) {
    // if (_cashe.containsKey(json['id'])) {
    //   return _cashe['id'];
    // } else {
    final place = new Place2._internal(
        json['id'],
        json['name'],
        json['guestrating'],
        json['kinds'],
        json['distance'],
        json['coordinate'] != null
            ? Coordinate.fromJson(json['coordinate'])
            : null);
    _cache[json['id']] = place;
    return place;
    // }
  }

  Place2._internal(this.id, this.name, this.guestRating, this.kinds,
      this.distance, this.coordinate);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['guestrating'] = this.guestRating;
    data['kinds'] = this.kinds;
    data['distance'] = this.distance;
    if (this.coordinate != null) {
      data['coordinate'] = this.coordinate!.toJson();
    }
    return data;
  }
}
