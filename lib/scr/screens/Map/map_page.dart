import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_app/scr/shared/constants.dart';

class MapPage extends StatefulWidget {
  final latitude;
  final longitude;
  final placeName;
  const MapPage(
      {Key key,
      @required this.latitude,
      @required this.longitude,
      @required this.placeName})
      : super(key: key);
  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.latitude, widget.longitude),
              zoom: 14.4746,
            ),
            markers: {
              Marker(
                  markerId: const MarkerId('placeMarker'),
                  infoWindow: InfoWindow(
                    title: widget.placeName,
                  ),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueAzure),
                  position: LatLng(widget.latitude, widget.longitude)),
            },
          ),
          SafeArea(
            child: Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
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
