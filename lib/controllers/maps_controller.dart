import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip_pal_null_safe/models/activities.dart';

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

  void addMarkers(List<Activity> coords) {
    coords.forEach((element) {
      markers.add(
        new Marker(
            position:
                LatLng(element.place!.latitude!, element.place!.longitude!),
            markerId: MarkerId(element.place!.name!),
            infoWindow: InfoWindow(
                title: element.place!.name!,
                snippet: 'Place type: ${element.place!.type!}'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)),
      );
    });
  }

  List<Marker> markers = List<Marker>.empty(growable: true);
}
