import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/animated_list_view_controller.dart';
import 'package:trip_pal_null_safe/models/hotel.dart';
import 'package:trip_pal_null_safe/services/api_view.dart';
import 'package:trip_pal_null_safe/services/backend_service.dart';
import 'package:trip_pal_null_safe/models/review.dart';

class ReviewsListController extends AnimatedListViewController {
  @override
  ApiView<Review> get api =>
      Get.find<BackendService>().getApiView(name: 'reviews');
  Place? place;
  void onInit() {
    place = Get.arguments;
    super.onInit();
  }

  @override
  double get closingThreshold => 50.0;

  @override
  double get containerSize => 147.0;
}
