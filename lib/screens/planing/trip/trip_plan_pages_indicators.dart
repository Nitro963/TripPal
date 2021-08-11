import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:trip_pal_null_safe/controllers/app_theme_controller.dart';
import 'package:trip_pal_null_safe/controllers/trip_planning_controller.dart';
import 'package:trip_pal_null_safe/models/day.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/themes.dart';

class PagesIndicators extends GetView<TripPlanningController> {
  final int index;
  final List<Day> days;
  PagesIndicators({required this.index, required this.days});
  @override
  Widget build(BuildContext context) {
    final customTheme =
        Themes.getCustomAppTheme(Get.find<AppThemeController>().themeMode);
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
                    padding: Spacing.symmetric(horizontal: 12.0),
                    child: Obx(
                      () => PageIndicatorItem(
                          index: index,
                          title: "Day ${days[index].dayIndex}",
                          date: DateTime.now(),
                          isSelected: controller.selectedIndex == index,
                          onTapCallBack: (int index) {
                            controller.selectedIndex = index;
                            controller.pageController.animateToPage(index,
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                          }),
                    ),
                  );
                }),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: double.infinity,
                  height: 1,
                  color: customTheme.disabledColor)),
        ]);
  }
}

class PageIndicatorItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final DateTime date;
  final int index;
  final void Function(int) onTapCallBack;
  final timeFormatter = intl.DateFormat("MMMM d,y");
  PageIndicatorItem(
      {required this.title,
      required this.date,
      required this.isSelected,
      required this.index,
      required this.onTapCallBack});

  @override
  Widget build(BuildContext context) {
    final themeData = Get.theme;
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: themeData.textTheme.headline6,
          ),
          Text(
            timeFormatter.format(date),
            style: themeData.textTheme.headline5!.copyWith(
              fontSize: 18,
            ),
          ),
          Visibility(
              replacement: SizedBox(height: 2),
              child: Container(
                  width: MySize.getScaledSizeWidth(120),
                  height: 2,
                  color: themeData.colorScheme.secondaryVariant),
              visible: isSelected),
        ],
      ),
      onTap: () {
        onTapCallBack(index);
      },
    );
  }
}
