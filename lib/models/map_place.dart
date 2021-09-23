class MapPlace {
  String? type;
  String? id;
  Geometry? geometry;
  Properties? properties;

  MapPlace({this.type, this.id, this.geometry, this.properties});

  static MapPlace fromJson(dynamic json) {
    return MapPlace(
        type: json['type'],
        id: json['id'],
        geometry: json['geometry'] != null
            ? Geometry.fromJson(json['geometry'])
            : null,
        properties: json['properties'] != null
            ? Properties.fromJson(json['properties'])
            : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    return data;
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({this.type, this.coordinates});

  static Geometry fromJson(dynamic json) {
    return Geometry(
      type: json['type'],
      coordinates: json['coordinates'].cast<double>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Properties {
  String? xid;
  String? name;
  double? dist;
  int? rate;
  String? osm;
  String? wikidata;
  String? kinds;

  Properties(
      {this.xid,
      this.name,
      this.dist,
      this.rate,
      this.osm,
      this.wikidata,
      this.kinds});

  static Properties fromJson(dynamic json) {
    return Properties(
      xid: json['xid'],
      name: json['name'],
      dist: json['dist'],
      rate: json['rate'],
      osm: json['osm'],
      wikidata: json['wikidata'],
      kinds: json['kinds'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xid'] = this.xid;
    data['name'] = this.name;
    data['dist'] = this.dist;
    data['rate'] = this.rate;
    data['osm'] = this.osm;
    data['wikidata'] = this.wikidata;
    data['kinds'] = this.kinds;
    return data;
  }
}
