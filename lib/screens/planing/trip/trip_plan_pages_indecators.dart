import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:trip_pal_null_safe/controllers/trip_planning_controller.dart';
import 'package:trip_pal_null_safe/models/day.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

class PagesIndicators extends GetView<TripPlanningController> {
  final int index;
  final List<Day> days;
  PagesIndicators({required this.index, required this.days});
  @override
  Widget build(BuildContext context) {
    controller.selectedIndex.value = index;
    return Stack(
        clipBehavior: Clip.antiAlias,
        alignment: AlignmentDirectional.bottomCenter,
        fit: StackFit.passthrough,
        children: [
          Container(
            height: MySize.getScaledSizeHeight(70),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Obx(() => PageIndicatorItem(
                        index: index,
                        title: "Day ${days[index].dayIndex}",
                        date: DateTime.now(),
                        isSelected: controller.selectedIndex.value == index,
                        onTapCallBack: (int index) {
                          controller.selectedIndex.value = index;
                          controller.pageController.animateToPage(index,
                              duration: Duration(seconds: 3),
                              curve: Curves.elasticOut);
                        })),
                  );
                }),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: double.infinity, height: 1, color: Colors.grey)),
        ]);
  }
}

class PageIndicatorItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final DateTime date;
  final double? height;
  final int index;
  final void Function(int) onTapCallBack;
  PageIndicatorItem(
      {required this.title,
      required this.date,
      required this.isSelected,
      required this.index,
      required this.onTapCallBack,
      this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: height ?? MySize.getScaledSizeHeight(70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700]),
            ),
            Text(intl.DateFormat("MMMM d,y").format(date),
                style: TextStyle(fontSize: 18, color: Colors.grey)),
            Visibility(
                replacement: SizedBox(height: 2),
                child: Container(
                    width: 80, height: 2, color: Get.theme.primaryColor),
                visible: isSelected),
          ],
        ),
      ),
      onTap: () {
        onTapCallBack(index);
      },
    );
  }
}
