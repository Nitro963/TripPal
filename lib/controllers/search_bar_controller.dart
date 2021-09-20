import 'dart:async';
import 'dart:collection';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:trip_pal_null_safe/models/PlacesSEData.dart';
import 'package:trip_pal_null_safe/models/map_place.dart';
import 'package:trip_pal_null_safe/models/place.dart';
import 'package:trip_pal_null_safe/models/place_type.dart';
import 'package:trip_pal_null_safe/services/backend_service.dart';
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
    _query.value = query;
    _isLoading.value = true;
    if (query.isEmpty) {
      _suggestions
        ..clear()
        ..addAll(history);
    } else {
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
  RxString markerInfoSnip = 'Tower'.obs;
  void updateLatLan(double lat, double lon) {
    latitude.value = lat;
    longitude.value = lon;
    updateCameraPosition();
  }

  void updateMapView(MapPlace newPlace) {
    print(newPlace.properties!.name);
    latitude.value = newPlace.geometry!.coordinates![1];
    longitude.value = newPlace.geometry!.coordinates![0];
    markerInfoWindowTitle.value = newPlace.properties!.name!;
    markerInfoSnip.value = newPlace.properties!.kinds!.split(',')[0];
    updateCameraPosition();
  }

  void getMyLocation() {
    _isMyLocation = false.obs;
    currentLocation.onLocationChanged.listen((event) {
      if (!_isMyLocation.value &&
          event.latitude != this.latitude.value &&
          event.longitude != this.longitude.value)
        updateLatLan(event.latitude!, event.latitude!);
      // mapController.animateCamera(
      //   CameraUpdate.newCameraPosition(
      //     CameraPosition(
      //         target: LatLng(event.latitude!, event.longitude!), zoom: 15),
      //   ),
      // );
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

  List<String> getSubtypes(String type) {
    List<String> result = List<String>.empty(growable: true);
    _placeTypes.forEach((element) {
      if (element.type == type) {
        result = element.subTypes;
      }
    });
    return result;
  }

  List<String> getTypes() {
    List<String> result = List<String>.empty(growable: true);
    _placeTypes.forEach((element) {
      result.add(element.type);
    });
    return result;
  }

  RxString _selectedType = ''.obs;
  RxString _selectedSubtype = ''.obs;

  String get selectedType => _selectedType.value;
  String get selectedSubtype => _selectedSubtype.value;

  void updateSelectedType(String newType) => _selectedType.value = newType;
  void updateSelectedSubtype(String newSubType) =>
      _selectedSubtype.value = newSubType;

  RxList<MapPlace> mapPlacesList = List<MapPlace>.empty(growable: true).obs;
  void updatemapPlacesList(values) {
    mapPlacesList.clear();
    mapPlacesList.addAll(values);
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

const Map<String, String> OpenTripMapTrueLabels = {
  'All Attractions & Culture': 'cultural',
  'Museums': 'museums',
  'Urban Environment': 'urban_environment',
  'Towers': 'towers',
  'Skyscrapers': 'skyscrapers',
  'Bridges': 'bridges',
  'Lightouses': 'lightouses',
  'All Foods & drinks': 'foods',
  'Cafes': 'cafes',
  'Restaurants': 'restaurants',
  'Fast Food': 'fast_food',
  'Food Courts': 'food_courts',
  'Picnic Sites': 'picnic_site',
  'Biergartens': 'biergartens',
  'Bars': 'bars',
  'Pubs': 'pubs',
  'All Shoppings': 'shops',
  'Bakeries': 'bakeries',
  'Conveniences': 'conveniences',
  'Fish Stores': 'fish_stores',
  'Malls': 'malls',
  'Marketplaces': 'marketplaces',
  'Outdoor': 'outdoor',
  'Supermarkets': 'supermarkets',
  'All Sports': 'sport',
  'Climbing': 'climbing',
  'Diving': 'diving',
  'Kitesurfing': 'kitesurfing',
  'Pools': 'pools',
  'Stadiums': 'stadiums',
  'Surfing': 'surfing',
  'Winter Sports': 'winter_sports',
  'All Outdoors': 'natural',
  'Beaches': 'beaches',
  'Glaciers': 'glaciers',
  'Islands': 'islands',
  'Natural Springs': 'natural_springs',
  'Natural Reserves': 'natural_reserves',
  'Water': 'water',
  'Geological Formations': 'geological_formations',
  'All Points of Interest': 'interesting_places',
  'Archaeology': 'archaeology',
  'Burial Places': 'burial_places',
  'Fortifications': 'fortifications',
  'Historical Places': 'historical_places',
  'Monuments and Memorials': 'monuments_and_memorials',
  'Industrial facilities': 'industrial_facilities',
  'All Motoring': 'transport',
  'Bicycle Rental': 'bicycle_rental',
  'Boat Sharing': 'boat_sharing',
  'Car Rental': 'car_rental',
  'Car Sharing': 'car_sharing',
  'Car Wash': 'car_wash',
  'Sharging Station': 'sharging_station',
  'Fuel': 'fuel',
  'All Entertainment': 'interesting_places',
  'Water Parks': 'water_parks',
  'Roller Coasters': 'roller_coasters',
  'Miniature Parks': 'miniature_parks',
  'Amusement Parks': 'amusement_parks',
  'Sauns': 'sauns',
  'Thermal bath': 'thermal_bath',
  'Apartments': 'apartments',
  'Villas and Chalet': 'villas and chalet',
  'Resorts': 'resorts',
  'Motels': 'motels',
  "Guest Houses": "guest_houses",
  'Campsites': 'campsites',
  'Alpine Huts': 'alpine_huts'
};
List<PlaceType> _placeTypes = [
  PlaceType(type: 'Attractions & Culture', subTypes: [
    'All Attractions & Culture',
    'Museums',
    'Theaters and entertainments',
    'Urban Environment',
    'Towers',
    'Skyscrapers',
    'Bridges',
    'Lightouses',
  ]),
  PlaceType(type: 'Food & Drink', subTypes: [
    'All Foods & drinks',
    'Cafes',
    'Restaurants',
    'Fast Food',
    'Food Courts',
    'Picnic Sites',
    'Biergartens',
    'Bars',
    'Pubs',
  ]),
  PlaceType(type: 'Shopping', subTypes: [
    'All Shoppings',
    'Bakeries',
    'Conveniences',
    'Fish Stores',
    'Malls',
    'Marketplaces',
    'Outdoor',
    'Supermarkets',
  ]),
  PlaceType(type: 'Sports', subTypes: [
    'All Sports',
    'Climbing',
    'Diving',
    'Kitesurfing',
    'Pools',
    'Stadiums',
    'Surfing',
    'Winter Sports',
  ]),
  PlaceType(type: 'OutDoors', subTypes: [
    'All Outdoors',
    'Beaches',
    'Glaciers',
    'Islands',
    'Natural Springs',
    'Natural Reserves',
    'Water',
    'Geological Formations'
  ]),
  PlaceType(type: 'Points of Interest', subTypes: [
    'All Points of Interest',
    'Archaeology',
    'Burial Places',
    'Fortifications',
    'Historical Places',
    'Monuments and Memorials',
    'Industrial facilities',
  ]),
  PlaceType(type: 'Motoring', subTypes: [
    'All Motoring',
    'Bicycle Rental',
    'boat Sharing',
    'Car Rental',
    'Car Sharing',
    'Car Wash',
    'Sharging Station',
    'Fuel',
  ]),
  PlaceType(type: 'Entertainment', subTypes: [
    'All Entertainment',
    'Water Parks',
    'Roller Coasters',
    'Miniature Parks',
    'Amusement Parks',
    'Sauns',
    'Thermal bath',
  ]),
  PlaceType(type: 'Accomodations', subTypes: [
    'Apartments',
    'Villas and Chalet',
    'Resorts',
    'Motels',
    "Guest Houses",
    'Campsites',
    'Alpine Huts'
  ])
];
