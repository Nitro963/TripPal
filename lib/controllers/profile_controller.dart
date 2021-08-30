import 'dart:collection';
import 'dart:developer' as dev;
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/PlacesSEData.dart';
import 'package:trip_pal_null_safe/models/place2.dart';
import 'package:trip_pal_null_safe/models/trip.dart';
import 'package:trip_pal_null_safe/models/user.dart';
import 'package:trip_pal_null_safe/services/backend_service.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';
import 'details_controller.dart';

class ProfileController extends DetailsController {
  late final User user;
  Rx<String> userName = ''.obs;
  Rx<String> userSubName = 'Great Planner'.obs;
  Rx<String> imgPath = ''.obs;

  // String userName = 'Rita Ora';
  // String userSubName = 'Great Planner';
  // TODO read from server
  // String imgPath = 'https://loremflickr.com/320/320/person?random=86';

  List<Place2> userSavedPlaces = List<Place2>.empty(growable: true);
  // List<Hotel> availableHotels = List<Hotel>.empty(growable: true);
  List<Place2> placeSearchResult = List<Place2>.empty(growable: true);
  List<Trip> usertrips = List<Trip>.empty(growable: true);
  @override
  void onInit() {
    // if (userSavedPlaces.isEmpty)
    // for (var trip in dummyTrips) {
    //   usertrips.add(new Trip(
    //       // city: trip.city,
    //       days: trip.days,
    //       // details: trip.details,
    //       // country: trip.country,
    //       // type: trip.type
    //       user:trip.user,
    //       startDate: trip.startDate
    //       ));
    // }
    for (var place in dummyJson) {
      userSavedPlaces.add(Place2.fromJson(place));
    }
    // for (var hotel in dummyHotels) {
    //   availableHotels.add(Place.fromJson(hotel));
    // }
    int c = 0;
    for (var place in dummyJson) {
      if (c == 3) break;
      placeSearchResult.add(Place2.fromJson(place));
      c++;
    }
    super.onInit();
  }

  @override
  void onReady() async {
    if (Get.parameters['user_id'] != null) {
      Get.find<BackendService>()
          .getApiView<User>(name: 'users')
          .getItem(int.parse(Get.parameters['user_id']!))
          .then((value) {
        user = value;
        userName(user.name);
        imgPath(user.profilePicture);
        hasData = true;
      }).onError((error, stackTrace) {
        errorModel = ErrorHandlerModel.fromError(error, onReady);
        hasError = true;
      });
    } else {
      userName("Guest");
      imgPath('/assets/images/2.jpg');
    }
  }

  UnmodifiableListView<Place2> get suggestions =>
      UnmodifiableListView(placeSearchResult);
}
