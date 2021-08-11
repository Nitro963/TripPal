import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripPlanningController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final Rx<DateTime> time = DateTime.now().obs;
  final PageController pageController = PageController();


}
