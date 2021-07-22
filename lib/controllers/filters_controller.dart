import 'package:get/get.dart';
import 'package:trip_pal_null_safe/dummy_data.dart';

class FilterController extends GetxController {
  @override
  void onInit() {
    for (var type in _types) {
      placesContentCheck[type] = false.obs;
      contentValues[type] = 5.0.obs;
    }
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
  RxDouble foods = 5.0.obs;
  RxDouble shops = 5.0.obs;
  RxDouble selectedPrice = 150.0.obs;
  RxDouble selectedStarRating = 3.0.obs;
  RxDouble selectedGuestRating = 5.0.obs;

  List<String> get placeType => this._types;

  final List<RxString> tripModes = ["Extended Trip".obs, "Focused Trip".obs];

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

  //Hotels Results Page
  RxString hotelsSortType = 'Best Seller'.obs;

  final List<RxString> hotelSortTypes = [
    'Best Seller'.obs,
    'Star Rating'.obs,
    'Distance fom Landmark'.obs,
    'Guest Rating'.obs,
    'Price'.obs
  ];

  void changeHotelsSortType(value) => hotelsSortType.value = value;
}
