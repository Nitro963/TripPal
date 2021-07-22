import 'dart:collection';

import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/PlacesSEData.dart';
import 'package:trip_pal_null_safe/models/hotel.dart';
import 'package:trip_pal_null_safe/models/place2.dart';

class ProfileController extends GetxController {
  String userName = 'Rita Ora';
  String userSubName = 'Great Planner';
  // TODO read from server
  String imgPath = 'assets/images/user_.jpg';

  List<Place2> userSavedPlaces = List<Place2>.empty(growable: true);
  List<Hotel> availableHotels = List<Hotel>.empty(growable: true);
  List<Place2> placeSearchResult = List<Place2>.empty(growable: true);

  @override
  void onInit() {
    // if (userSavedPlaces.isEmpty)
    for (var place in dummyJson) {
      userSavedPlaces.add(Place2.fromJson(place));
    }
    for (var hotel in dummyHotels) {
      availableHotels.add(Hotel.fromJson(hotel));
    }
    int c = 0;
    for (var place in dummyJson) {
      if (c == 3) break;
      placeSearchResult.add(Place2.fromJson(place));
      c++;
    }
    super.onInit();
  }

  UnmodifiableListView<Place2> get suggestions =>
      UnmodifiableListView(placeSearchResult);
}
