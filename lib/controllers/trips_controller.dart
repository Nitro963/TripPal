import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/dummy_data.dart';
import 'package:trip_pal_null_safe/models/sort_policy.dart';

class TripsController extends GetxController {
  final _inAsyncCall = false.obs;
  bool get inAsyncCall => _inAsyncCall.value;
  set inAsyncCall(bool value) {
    _inAsyncCall.value = value;
  }

  @override
  void onInit() {
    for (var type in _types) {
      placesContentCheck[type] = false.obs;
      contentValues[type] = 5.0.obs;
    }
    for (String city in this.cities) this.locsContentCheck[city] = false.obs;

    super.onInit();
  }

  final List<String> _types = [
    'Historic',
    'Cultural',
    'Natural',
    'Religion',
    'Sport',
    'Architecture',
  ].obs;

  bool visible = false;

  RxBool foodsChecked = false.obs;
  RxBool shopsChecked = false.obs;

  Map<String, RxBool> locsContentCheck = Map<String, RxBool>();
  Map<String, RxDouble> contentValues = Map<String, RxDouble>();

  RxDouble daysCount = 3.0.obs;

  RxDouble placesPerDay = 3.0.obs;
  RxDouble foods = 2.0.obs;
  RxDouble shops = 2.0.obs;
  RxDouble selectedPrice = 150.0.obs;
  RxDouble selectedStarRating = 3.0.obs;
  RxDouble selectedGuestRating = 5.0.obs;

  List<String> get placeType => this._types;

  final List<RxString> tripModes = ["Extended Trip".obs, "Focused Trip".obs];

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  RxString tripMode = 'Extended Trip'.obs;
  void onClickRadioButton(value) {
    tripMode.value = value;
  }

  // Countries page
  final List<String> cities = dummyCities;
  List<String> selectedCities = List<String>.empty(growable: true).obs;
  void selectLocs() {
    selectedCities.clear();
    for (String city in locsContentCheck.keys)
      if (locsContentCheck[city] == true.obs) selectedCities.add(city);
  }

  //Advanced Filters Page
  Map<String, RxBool> placesContentCheck = Map<String, RxBool>();
  List<String> selectedTypes = List<String>.empty(growable: true).obs;
  void selectPlaces() {
    selectedTypes.clear();
    placesContentCheck.keys.forEach((element) {
      if (placesContentCheck[element]!.value) selectedTypes.add(element);
    });
  }

  List<SortPolicy> get sortPolices => [
        SortPolicy('Most Resent', '', 1, 'most_resent'),
        SortPolicy('Most Popular', '', 2, 'most_popular'),
        SortPolicy('Trip Duration', '', 3, 'trip_duration'),
        SortPolicy('Count of Places', '', 4, 'count_of_places'),
      ];

  int get sortPolicy => _sortPolicy.value;

  set sortPolicy(int? value) {
    if (value != null) {
      _sortPolicy.value = value;
      refreshIndicatorKey.currentState!.show();
    }
  }

  var _sortPolicy = 0.obs;

  //Trip Filters Page
  RxString sortType = 'Most Resent'.obs;

  RxString sortOrder = 'Descending'.obs;

  final List<RxString> tripsSortType = [
    'Most Resent'.obs,
    'Most Popular'.obs,
    'Trip Duration'.obs,
    'Count of Places'.obs
  ];

  final List<RxString> tripsSortOrder = ['Descending'.obs, 'Ascending'.obs];

  void changeTripsSortOrder(value) => sortOrder.value = value;

  void changeTripsSortType(value) => sortType.value = value;

  //shared trips page

  RxBool closeHeader = false.obs;

  RxDouble topContainer = 0.0.obs;

  Map<String, dynamic> serializePreferences() {
    var locations = List<String>.empty(growable: true);
    locsContentCheck.entries.forEach((element) {
      locations.addIf(element.value.value, element.key);
    });
    var types = List<String>.empty(growable: true);
    placesContentCheck.entries.forEach((element) {
      types.addIf(element.value.value, element.key);
    });
    Map<String, int> typesMap = Map<String, int>();
    types.forEach((element) {
      typesMap[element.toUpperCase().substring(0, 3)] =
          contentValues[element]!.value.toInt();
    });
    return {
      'locations': locations,
      'trip_mode': tripMode.value == 'Extended Trip' ? 1 : 2,
      'food_importance': foodsChecked.value ? foods.value : 0,
      'shop_importance': shopsChecked.value ? shops.value : 0,
      'days_count': daysCount.value,
      'places_per_day': tripMode.value == 'Extended Trip' ? 6 : 2,
      'shop_dis': false,
      'places_preferences': typesMap
    };
  }
}
