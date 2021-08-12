import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/day_item.dart';
import 'package:trip_pal_null_safe/widgets/transformer_page_view/transformer_page_view.dart';

class TripPlanningController extends GetxController {
  final RxInt _selectedIndex = 0.obs;
  final itemCount;
  late final TransformerPageController pageController;

  TripPlanningController(this.itemCount);

  void onInit() {
    // TODO read item count from backend
    pageController = TransformerPageController(itemCount: itemCount);
    super.onInit();
  }

  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value) {
    _selectedIndex.value = value;
  }

  List<DateTime> generateTime(items) {
    List<DateTime> result = List<DateTime>.empty(growable: true);
    DateTime startingTime = DateTime.parse("2021-08-12 09:00:00.000");
    result.add(startingTime);
    items.forEach((element) {
      if (element['item_type'].contains('food'))
        startingTime = startingTime.add(Duration(hours: 1, minutes: 45));
      else if (element['item_type'].contains('shop'))
        startingTime = startingTime.add(Duration(hours: 2, minutes: 45));
      else
        startingTime = startingTime.add(Duration(hours: 1, minutes: 30));

      result.add(startingTime);
    });
    return result;
  }

  List<String> generateSubType(items) {
    List<String> result = List<String>.empty(growable: true);
    int foodsCount = 0;
    items.forEach((element) {
      if (element['item_type'].contains('food')) foodsCount++;
    });
    items.forEach((element) {
      if (element['item_type'].contains('food') && foodsCount > 0) {
        if (foodsCount == 3) {
          result.add('Breakfast');
          foodsCount--;
        } else if (foodsCount == 1) {
          result.add('Dinner');
          foodsCount--;
        } else {
          result.add('Lunch');
          foodsCount--;
        }
      } else if (element['item_type'].contains('hotel'))
        result.add('Waking up');
      else if (element['item_type'].contains('shop'))
        result.add('Shopping');
      else
        result.add('Touring');
    });
    return result;
  }
  
}
