class Coordinate {
  double lat;
  double lon;

  Coordinate({required this.lat, required this.lon});

  static Coordinate fromJson(Map<String, dynamic> json) {
    return Coordinate(lat: json['lat']!, lon: json['lon']!);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}
