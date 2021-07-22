import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/models/Day.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:intl/intl.dart' as intl;

Rx<int> selectedIndex = 0.obs;

class PagesIndicators extends StatelessWidget {
  final PageController controller;
  final int index;
  final List<Day> days;
  PagesIndicators(
      {required this.controller, required this.index, required this.days});
  @override
  Widget build(BuildContext context) {
    selectedIndex.value = index;
    return Container(
      width: double.infinity,
      height: MySize.size10,
      child: Stack(children: [
        ListView.builder(
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
                          duration: Duration(milliseconds: 500),
                          curve: Curves.slowMiddle);
                    })),
              );
            }),
        Align(
          alignment: Alignment.bottomCenter,
          heightFactor: MySize.getScaledSizeHeight(14),
          child: Divider(),
        ),
        Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              child: Icon(Icons.add, color: Colors.white, size: 26),
              backgroundColor: Get.theme.primaryColor,
            ))
      ]),
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
      child: SizedBox(
          width: MySize.getScaledSizeWidth(25),
          height: MySize.size10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700]),
              ),
              Spacer(),
              Text(intl.DateFormat("MMMM d,y").format(date),
                  style: TextStyle(fontSize: 18, color: Colors.grey)),
              Spacer(),
              SizedBox(
                height: 2,
                child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      if (isSelected)
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                width: 80,
                                height: 2,
                                color: Get.theme.primaryColor))
                    ]),
              ),
              Spacer(),
            ],
          )),
      onTap: () {
        onTapCallBack(index);
      },
    );
  }
}
