import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/animated_list_view_controller.dart';
import 'package:trip_pal_null_safe/services/api_view.dart';
import 'package:trip_pal_null_safe/services/backend_service.dart';
import 'package:trip_pal_null_safe/models/review.dart';

class TripsListController extends AnimatedListViewController {
  @override
  ApiView<Review> get api => Get.find<BackendService>().reviewsApi;

  @override
  double get closingThreshold => 20.0;

  @override
  double get containerSize => 200.0;
}
