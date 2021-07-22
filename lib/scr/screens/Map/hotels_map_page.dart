import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_app/scr/controllers/profile_controller.dart';
import 'package:travel_app/scr/screens/places/components/hotel_class.dart';
import 'package:travel_app/scr/shared/constants.dart';

class HotelsMapPage extends StatefulWidget {
  @override
  State<HotelsMapPage> createState() => HotelsMapPageState();
}

class HotelsMapPageState extends State<HotelsMapPage> {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    List<Marker> markers = List<Marker>.empty(growable: true);
    for (Hotel hotel in controller.availableHotels) {
      markers.add(
        new Marker(
            markerId: const MarkerId('hotelMarker'),
            infoWindow: InfoWindow(
              title: hotel.name,
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
            position: LatLng(hotel.coordinate!.lat, hotel.coordinate!.lon)),
      );
    }
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(controller.availableHotels[0].coordinate!.lat,
                  controller.availableHotels[0].coordinate!.lon),
              zoom: 14.4746,
            ),
            markers: {for (Marker marker in markers) marker},
          ),
          SafeArea(
            child: Container(
              height: MySize.screenHeight,
              width: MySize.screenWidth,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: Colors.blueGrey[800],
                    ),
                    onPressed: () => Get.back(),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
