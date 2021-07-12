import 'dart:async';
import 'dart:collection';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:travel_app/scr/models/place.dart';
import 'package:travel_app/scr/screens/places/components/place_class.dart';
import 'package:travel_app/scr/shared/services/networking.dart';

class PlacesSearchController extends GetxController {
  RxBool _isMyLocation = false.obs;
  RxBool _isLoading = false.obs;
  RxList<Place> _suggestions = history.obs;
  RxString _query = ''.obs;

  bool get isLoading => _isLoading.value;

  UnmodifiableListView<Place> get suggestions =>
      UnmodifiableListView(_suggestions);

  String get query => _query.value;

  bool get isHistory => _query.isEmpty;

  Future<void> onQueryChanged(String query) async {
    if (query == _query.value) return;

    _query.value = query;
    _isLoading.value = true;

    if (query.isEmpty) {
      _suggestions
        ..clear()
        ..addAll(history);
    } else {
      final res = await PhotonAPI.getQuery(query);
      _suggestions
        ..clear()
        ..addAll(res);
    }
    _isLoading.value = false;
  }

  void clear() {
    _suggestions
      ..clear()
      ..addAll(history);
  }

  RxDouble mapHeight = 100.0.obs;
  void updateMapHeight(double size) {
    mapHeight.value = size;
  }

  @override
  void onInit() {
    cameraPosition = CameraPosition(
      target: LatLng(latitude.value, longitud.value),
      zoom: 14.4746,
    );
    super.onInit();
  }

  RxDouble latitude = 25.1972.obs;
  RxDouble longitud = 55.2744.obs;
  CameraPosition cameraPosition;
  GoogleMapController mapController;
  Location currentLocation = Location();
  RxString markerInfoWindowTitle = 'Burj Khalifa'.obs;

  void updateLatLan(double lat, double lon) {
    latitude.value = lat;
    longitud.value = lon;
    updateCameraPosition();
  }

  void updateMapView(Place2 newPlace) {
    print(newPlace.name);
    latitude.value = newPlace.coordinate.lat;
    longitud.value = newPlace.coordinate.lon;
    markerInfoWindowTitle.value = newPlace.name;
    updateCameraPosition();
  }

  void getMyLocation() {
    _isMyLocation = false.obs;
    currentLocation.onLocationChanged.listen((event) {
      if (!_isMyLocation.value &&
          event.latitude != this.latitude.value &&
          event.longitude != this.longitud.value)
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(event.latitude, event.longitude), zoom: 15),
          ),
        );
      this._isMyLocation.value = true;
    });
  }

  void updateCameraPosition() {
    this.cameraPosition = CameraPosition(
      target: LatLng(this.latitude.value, this.longitud.value),
      zoom: 14.4746,
    );
    mapController
        .animateCamera(CameraUpdate.newCameraPosition(this.cameraPosition));
  }
}

List<Place> history = [
  Place(
    name: 'San Fracisco',
    country: 'United States of America',
    state: 'California',
  ),
  Place(
    name: 'Singapore',
    country: 'Singapore',
  ),
  Place(
    name: 'Munich',
    state: 'Bavaria',
    country: 'Germany',
  ),
  Place(
    name: 'London',
    country: 'United Kingdom',
  ),
  Place(
    name: 'Zahle',
    country: 'Lebanon',
  ),
];
