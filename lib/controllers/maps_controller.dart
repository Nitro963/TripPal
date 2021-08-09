import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip_pal_null_safe/models/day_item.dart';

class MapController extends GetxController {

  late final GoogleMapController mapController;

  double _getHueColor(String placeType) {
    if (placeType.contains('food'))
      return BitmapDescriptor.hueRed;
    else if (placeType.contains('shop'))
      return BitmapDescriptor.hueViolet;
    else if (placeType.contains('hotel')) return BitmapDescriptor.hueGreen;
    return BitmapDescriptor.hueBlue;
  }

  void addMarkers(List<Item> coords) {
    coords.forEach((element) {
      markers.add(
        new Marker(
            position: element.coordinate,
            markerId: MarkerId(element.name),
            infoWindow: InfoWindow(
                title: element.name, snippet: 'Place type: ' + element.type),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                _getHueColor(element.type))),
      );
    });

  }

  List<Marker> markers = List<Marker>.empty(growable: true);
}
