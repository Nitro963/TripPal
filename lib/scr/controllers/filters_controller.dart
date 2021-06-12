import 'package:get/get.dart';
import 'package:travel_app/scr/models/DemoData.dart';

// enum TripMode { extendedTrip, focusedTrip }

class FilterController extends GetxController {
  @override
  void onInit() {
    selectedCities.add('dada');
    selectedCities.add('dodo');

    for (var type in _types) {
      placesContentCheck[type] = false.obs;
      contentValues[type] = 5.0.obs;
      super.onInit();
    }
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

  bool foodsChecked = false;
  bool shopsChecked = false;

  Map<String, RxBool> locsContentCheck = Map<String, RxBool>();
  Map<String, RxDouble> contentValues = Map<String, RxDouble>();

  RxDouble daysCount = 3.0.obs;

  RxDouble placesPerDay = 3.0.obs;
  RxDouble foods = 5.0.obs;
  RxDouble shops = 5.0.obs;

  List<String> get placeType => this._types;

  final List<String> tripModes = ["Extended", "Focused"];

  String tripMode = 'Extended';
  void onClickRadioButton(value) {
    print(value);
    tripMode = value;
    update();
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
    for (String city in placesContentCheck.keys)
      if (placesContentCheck[city] == true.obs) selectedTypes.add(city);
  }
}
