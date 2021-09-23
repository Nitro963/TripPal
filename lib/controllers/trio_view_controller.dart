import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/trips_list_controller.dart';
import 'package:trip_pal_null_safe/models/day.dart';

class TripViewController extends TripsListController {
  RxList<Day> days = RxList<Day>();
}
