import 'package:get/get.dart';
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
}
