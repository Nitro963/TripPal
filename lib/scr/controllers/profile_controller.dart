import 'package:get/get.dart';
import 'package:travel_app/scr/models/PlacesSEData.dart';
import 'package:travel_app/scr/screens/places/components/hotel_class.dart';
import 'package:travel_app/scr/screens/places/components/place_class.dart';

class ProfileContnroller extends GetxController {
  String userName = 'justine';
  String userSubName = 'Great Planner';
  String imgPath = 'images/user_.jpg';

  List<Place2> userSavedPlaces = List<Place2>.empty(growable: true);
  List<Hotel> availableHotels = List<Hotel>.empty(growable: true);
  

  @override
  void onInit() {
    // if (userSavedPlaces.isEmpty)
      for (var place in dummyJson) {
        userSavedPlaces.add(Place2.fromJson(place));
      }
       for (var hotel in dummyHotels) {
        availableHotels.add(Hotel.fromJson(hotel));
      }
    super.onInit();
  }
}
