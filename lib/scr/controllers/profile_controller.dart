import 'dart:collection';

import 'package:get/get.dart';
import 'package:travel_app/scr/models/PlacesSEData.dart';
import 'package:travel_app/scr/screens/places/components/hotel_class.dart';
import 'package:travel_app/scr/screens/places/components/place_class.dart';

class ProfileContnroller extends GetxController {
  String userName = 'Rita Ora';
  String userSubName = 'Great Planner';
  String imgPath = 'images/user_.jpg';

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
