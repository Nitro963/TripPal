import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/details_controller.dart';
import 'package:trip_pal_null_safe/models/activities.dart';
import 'package:trip_pal_null_safe/models/day.dart';
import 'package:trip_pal_null_safe/models/property.dart';
import 'package:trip_pal_null_safe/models/trip.dart';
import 'package:trip_pal_null_safe/services/backend_service.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';
import 'package:trip_pal_null_safe/widgets/transformer_page_view/transformer_page_view.dart';

class TripPlanningController extends DetailsController {
  late final int tripID;
  late final Trip trip;
  final RxInt _selectedIndex = 0.obs;
  late final TransformerPageController pageController;
  late final int itemCount;

  TripPlanningController();

  void onInit() {
    itemCount = int.parse(Get.parameters['len']!);
    pageController = TransformerPageController(itemCount: itemCount);
    tripID = int.parse(Get.parameters['id']!);
    super.onInit();
  }

  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value) {
    _selectedIndex.value = value;
  }

  DateTime generateTime(Activity activity) {
    List<DateTime> result = List<DateTime>.empty(growable: true);
    DateTime startingTime = trip.startDate;
    result.add(startingTime);
    for (Property element in activity.place!.properties) {
      if (element.name == ('food'))
        startingTime = startingTime.add(Duration(hours: 1, minutes: 45));
      else if (element.name == ('shop'))
        startingTime = startingTime.add(Duration(hours: 2, minutes: 45));
      else
        startingTime = startingTime.add(Duration(hours: 1, minutes: 30));
      break;
    }
    return startingTime;
  }

  List<String> generateSubType(Day day) {
    List<String> result = List<String>.empty(growable: true);
    day.activities.forEach((element) {
      if (element.place!.type == 2) {
        result.add('Waking up');
      } else {
        if (element.place!.properties[0].name == 'food') {
          result.add('Eating');
        } else if (element.place!.properties[0].name == 'shop') {
          result.add('Shopping');
        } else {
          result.add('Touring');
        }
      }
    });
    return result;
  }

  void onReady() {
    hasError = false;
    hasData = false;
    Get.find<BackendService>()
        .getApiView<Trip>(name: 'trips')
        .getItem(tripID)
        .then((val) {
      trip = val;
      hasData = true;
    }).onError((error, stackTrace) {
      errorModel = ErrorHandlerModel.fromError(error, onReady);
      hasError = true;
    });
  }
}
