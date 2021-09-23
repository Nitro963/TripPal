class Location {
  String? name;
  String? country;
  double? lat;
  double? lon;
  int? population;
  String? timezone;
  String? status;

  Location(
      {this.name,
      this.country,
      this.lat,
      this.lon,
      this.population,
      this.timezone,
      this.status});

  Location.fromJson(dynamic json) {
    name = json['name'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    population = json['population'];
    timezone = json['timezone'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['country'] = this.country;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['population'] = this.population;
    data['timezone'] = this.timezone;
    data['status'] = this.status;
    return data;
  }
}
