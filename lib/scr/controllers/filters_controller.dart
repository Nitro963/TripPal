import 'package:get/get.dart';

// enum TripMode { extendedTrip, focusedTrip }

class FilterController extends GetxController {
  @override
  // ignore: must_call_super
  void onInit() {
    for (var type in placeType) {
      contentCheck[type] = false.obs;
      contentValues[type] = 5;
    }
  }

  // List<String> tripMode = ['extendedTrip', 'focusedTrip'];

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

  // TripMode tripMode = TripMode.extendedTrip;

  Map<String, RxBool> contentCheck = Map<String, RxBool>();
  Map<String, double> contentValues = Map<String, double>();

  double daysCount = 3;

  double placesPerDay = 3;
  double foods = 5;
  double shops = 5;

  List<String> get placeType => this._types;

  final List<String> tripModes = ["Extended", "Focused"];

  String tripMode = 'Extended';
  void onClickRadioButton(value) {
    print(value);
    tripMode = value;
    update();
  }
}
