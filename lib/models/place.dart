import 'abstract_model.dart';

class Place extends IModel {
  final String name;
  final String? state;
  final String country;
  String? image;
  double? rating;
  double? lat;
  double? lon;
  String? type;

  Place(
      {id,
      required this.name,
      required this.country,
      this.state,
      this.image,
      this.rating,
      this.lat,
      this.lon,
      this.type})
      : super(id); //assert(country.isNotEmpty & name.isNotEmpty);

  bool get hasState => state?.isNotEmpty == true;

  bool get isCountry => name == country;

  bool get isState => hasState && name == state;

  static Place fromJson(dynamic json) {
    final props = json['properties'];
    return Place(
        name: props['name'] ?? '',
        state: props['state'] ?? '',
        country: props['country'] ?? '',
        type: props['type'],
        lat: double.parse(json['geometry']['coordinates'][1].toString()),
        lon: double.parse(json['geometry']['coordinates'][0].toString()));
  }

  String get address {
    if (isCountry) return country;
    return '$name, $level2Address';
  }

  String get addressShort {
    if (isCountry) return country;
    return '$name, $country';
  }

  String get level2Address {
    if (isCountry || isState || !hasState) return country;
    if (!hasState) return state!;
    return '$country';
  }

  @override
  String toString() => 'Place(name: $name, state: $state, country: $country)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Place &&
        o.name == name &&
        o.state == state &&
        o.country == country;
  }

  @override
  int get hashCode => name.hashCode ^ state.hashCode ^ country.hashCode;

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
