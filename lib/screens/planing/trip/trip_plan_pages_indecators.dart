import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:trip_pal_null_safe/models/day.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

// WHY!!!!!!!
// TODO convert to GetView and user controllers
Rx<int> selectedIndex = 0.obs;

// WHY Use stack?!
class PagesIndicators extends StatelessWidget {
  final PageController controller;
  final int index;
  final List<Day> days;
  PagesIndicators(
      {required this.controller, required this.index, required this.days});
  @override
  Widget build(BuildContext context) {
    selectedIndex.value = index;
    return Column(
      mainAxisSize: MainAxisSize.min,
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
                      isSelected: selectedIndex.value == index,
                      onTapCallBack: (int index) {
                        selectedIndex.value = index;
                        controller.animateToPage(index,
                            duration: Duration(seconds: 3),
                            curve: Curves.elasticOut);
                      })),
                );
              }),
        ),
        Divider(thickness: 2),
      ],
    );
  }
}

class PageIndicatorItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final DateTime date;
  final int index;
  final void Function(int) onTapCallBack;
  PageIndicatorItem(
      {required this.title,
      required this.date,
      required this.isSelected,
      required this.index,
      required this.onTapCallBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      onTap: () {
        onTapCallBack(index);
      },
    );
  }
}
