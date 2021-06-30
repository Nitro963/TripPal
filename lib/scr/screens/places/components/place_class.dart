class Place2 {
  String id;
  String name;
  int guestrating;
  String kinds;
  double distance;
  Coordinate coordinate;

  static Map<String, Place2> _cashe = <String, Place2>{};

  factory Place2(String id, String name, int guestrating, String kinds,
      double distance, Coordinate coordinate) {
    if (_cashe.containsKey(id)) {
      return _cashe['id'];
    } else {
      final place =
          Place2._internal(id, name, guestrating, kinds, distance, coordinate);
      _cashe[id] = place;
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
              ? new Coordinate.fromJson(json['coordinate'])
              : null);
      _cashe[json['id']] = place;
      return place;
    // }
  }

  Place2._internal(this.id, this.name, this.guestrating, this.kinds,
      this.distance, this.coordinate);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['guestrating'] = this.guestrating;
    data['kinds'] = this.kinds;
    data['distance'] = this.distance;
    if (this.coordinate != null) {
      data['coordinate'] = this.coordinate.toJson();
    }
    return data;
  }
}

class Coordinate {
  double lat;
  double lon;

  Coordinate({this.lat, this.lon});

  Coordinate.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}
