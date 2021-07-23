import 'dart:async';
import 'dart:collection';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:trip_pal_null_safe/models/place.dart';
import 'package:trip_pal_null_safe/models/place2.dart';
import 'package:trip_pal_null_safe/services/geocoding_service.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

class SearchBarController extends GetxController {
  RxBool _isMyLocation = false.obs;
  RxBool _isLoading = false.obs;
  RxList<Place> _suggestions = history.obs;
  RxString _query = ''.obs;

  bool get isLoading => _isLoading.value;

  UnmodifiableListView<Place> get suggestions =>
      UnmodifiableListView(_suggestions);

  String get query => _query.value;

  bool get isHistory => _query.isEmpty;

  late final PhotonApi _photon;

  Future<void> onQueryChanged(String query) async {
    if (query == _query.value) return;
    print('tjjjj');

    _query.value = query;
    _isLoading.value = true;

    if (query.isEmpty) {
      _suggestions
        ..clear()
        ..addAll(history);
    } else {
      print('jjjj');
      final res = await _photon.getQuery(query, 6);
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

  RxDouble mapHeight = 0.0.obs;

  void updateMapHeight(double size) {
    mapHeight.value = size;
  }

  @override
  void onInit() {
    cameraPosition = CameraPosition(
      target: LatLng(latitude.value, longitude.value),
      zoom: 14.4746,
    );
    _photon = Get.find<GeoCodingService>().photon;
    mapHeight.value = MySize.screenHeight / 3;
    super.onInit();
  }

  RxDouble latitude = 25.1972.obs;
  RxDouble longitude = 55.2744.obs;
  late CameraPosition cameraPosition;
  late GoogleMapController mapController;
  Location currentLocation = Location();
  RxString markerInfoWindowTitle = 'Burj Khalifa'.obs;

  void updateLatLan(double lat, double lon) {
    latitude.value = lat;
    longitude.value = lon;
    updateCameraPosition();
  }

  void updateMapView(Place2 newPlace) {
    print(newPlace.name);
    latitude.value = newPlace.coordinate!.lat;
    longitude.value = newPlace.coordinate!.lon;
    markerInfoWindowTitle.value = newPlace.name;
    updateCameraPosition();
  }

  void getMyLocation() {
    _isMyLocation = false.obs;
    currentLocation.onLocationChanged.listen((event) {
      if (!_isMyLocation.value &&
          event.latitude != this.latitude.value &&
          event.longitude != this.longitude.value)
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(event.latitude!, event.longitude!), zoom: 15),
          ),
        );
      this._isMyLocation.value = true;
    });
  }

  void updateCameraPosition() {
    this.cameraPosition = CameraPosition(
      target: LatLng(this.latitude.value, this.longitude.value),
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
