import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:trip_pal_null_safe/controllers/animated_list_view_controller.dart';
import 'package:trip_pal_null_safe/models/filter.dart';
import 'package:trip_pal_null_safe/models/hotel.dart';
import 'package:trip_pal_null_safe/models/sort_policy.dart';
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

  @override
  List<Filter> get filteringPolices => [
        DateFilter('date', intl.DateFormat('yyyy-MM-dd')),
        RangeFilter('overall_rating', 0, 5)
      ];

  List<SortPolicy> get sortPolices => [
        SortPolicy('None', null, 0, 'null'),
        SortPolicy('Rate', 'Low to High', 1, '-overall_rating'),
        SortPolicy('Rate', 'High to Low', 2, 'overall_rating'),
        SortPolicy('Date', 'Most recent', 3, '-date'),
        SortPolicy('Date', 'Oldest first', 4, 'date'),
      ];
}
