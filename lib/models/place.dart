class Place {
  final String name;
  final String? state;
  final String country;
  String? image;
  double? rating;
  double? lat;
  double? lon;

  Place({
    required this.name,
    required this.country,
    this.state,
    this.image,
    this.rating,
    this.lat,
    this.lon,
  }) : assert(country.isNotEmpty & name.isNotEmpty);

  bool get hasState => state?.isNotEmpty == true;

  bool get isCountry => name == country;
  bool get isState => hasState && name == state;

  static Place fromJson(dynamic json) {
    final props = json['properties'];

    return Place(
      name: props['name'] ?? '',
      state: props['state'] ?? '',
      country: props['country'] ?? '',
    );
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
}
