import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/animated_list_view_controller.dart';
import 'package:trip_pal_null_safe/models/filter.dart';
import 'package:trip_pal_null_safe/models/sort_policy.dart';
import 'package:trip_pal_null_safe/models/trip.dart';
import 'package:trip_pal_null_safe/services/api_view.dart';
import 'package:trip_pal_null_safe/services/backend_service.dart';
import 'package:intl/intl.dart' as intl;

class TripsListController extends AnimatedListViewController<Trip> {
  @override
  double get closingThreshold => 20.0;

  @override
  double get containerSize => 200.0;

  @override
  ApiView<Trip> get api => Get.find<BackendService>().getApiView(name: 'trips');
  
  @override
  List<SortPolicy> get sortPolices => [
         SortPolicy('None', null, 0, 'null'),
        SortPolicy('Trip Start Date', 'Most recent', 1, '-start_date'),
        SortPolicy('Trip Start Date', 'Oldest first', 2, 'start_date'),
        SortPolicy('Trip Days', 'Longest First', 3, '-days_count'),
        SortPolicy('Trip Days', 'Shortest First', 4, 'days_count'),
  ];  
  @override
  List<Filter> get filteringPolices => [
      DateFilter('start_date', intl.DateFormat('yyyy-MM-dd')),
      RangeFilter('days_count', 1, 15),
  ];

}
