import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/models/days.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:intl/intl.dart' as intl;

Rx<int> selectedIndex = 0.obs;

class PagesIndecators extends StatelessWidget {
  final PageController controller;
  final int index;
  final List<Days> days;
  PagesIndecators({this.controller, this.index, this.days});
  @override
  Widget build(BuildContext context) {
    SizeConfig.init();
    selectedIndex.value = index;

    return Container(
      width: double.infinity,
      height: SizeConfig.blockSizeVertical * 10,
      child: Stack(children: [
        ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: days.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Obx(() => PageIndecectorItem(
                    index: index,
                    title: "Day ${days[index].day}",
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

class PageIndecectorItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final TextStyle style;
  final DateTime date;
  final int index;
  final Function(int) onTapCallBack;
  PageIndecectorItem(
      {this.title,
      this.date,
      this.isSelected,
      this.style,
      this.index,
      this.onTapCallBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
          width: SizeConfig.blockSizeHorizontal * 25,
          child: SizedBox(
            height: SizeConfig.blockSizeVertical * 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 26),
                ),
                Text(intl.DateFormat.yMd().format(date),
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
                SizedBox(
                  height: SizeConfig.blockSizeVertical,
                  child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        if (isSelected)
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  width: 60, height: 2, color: Colors.green))
                      ]),
                ),
              ],
            ),
          )),
      onTap: () {
        onTapCallBack(index);
      },
    );
  }
}
