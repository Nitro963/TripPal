import 'package:google_maps_flutter/google_maps_flutter.dart';

class Item {
  final String type;
  final String id;
  final String name;
  final String rate;
  final LatLng coordinate;

  Item(
      {required this.type,
      required this.id,
      required this.coordinate,
      required this.name,
      required this.rate});
}
