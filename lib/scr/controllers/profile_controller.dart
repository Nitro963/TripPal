import 'package:get/get.dart';
import 'package:travel_app/scr/models/PlacesSEData.dart';
import 'package:travel_app/scr/screens/places/components/place_class.dart';

class ProfileContnroller extends GetxController {
  String userName = 'Beyonce';
  String userSubName = 'Great Planner';
  String imgPath = 'images/profile.jpg';

  List<Place2> userSavedPlaces = List<Place2>.empty(growable: true);
  @override
  void onInit() {
    // if (userSavedPlaces.isEmpty)
      for (var place in dummyJson) {
        userSavedPlaces.add(Place2.fromJson(place));
      }
    super.onInit();
  }
}
