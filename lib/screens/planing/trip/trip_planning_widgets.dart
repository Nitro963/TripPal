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
  final int daysCount;
  PagesIndicators({required this.index, required this.daysCount});
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
            
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: daysCount,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: Spacing.symmetric(horizontal: 12.0),
                    child: Obx(
                      () => PageIndicatorItem(
                          index: index,
                          title: "Day ${index+1}",
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
            style: themeData.textTheme.subtitle1!.copyWith(
              fontSize: 16,
            ),
          ),
          Visibility(
              replacement: SizedBox(height: 2),
              child: Container(
                  width: MySize.getScaledSizeWidth(120),
                  height: 5,
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


class CustomStepper extends StatelessWidget {
  final plan;
  final String subType;
  final Color lineColor;
  final DateTime time;
  final timeFormatter = intl.DateFormat("hh:mm a");
  CustomStepper(
      {required this.subType,
      required this.time,
      required this.plan,
      this.lineColor = Colors.grey});
  @override
  Widget build(BuildContext context) {
    final themeData = Get.theme;
    return Padding(
      padding: Spacing.symmetric(horizontal: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: MySize.size80,
              child: Column(
                children: <Widget>[
                  Text(timeFormatter.format(time),
                      style: themeData.textTheme.subtitle2!
                          .copyWith(color: lineColor)),
                  SizedBox(height: 10.0),
                  Text(subType)
                ],
              )),
          SizedBox(width: 10),
          CustomPaint(
            painter: LinePainter(progress: 100.0, color: lineColor),
            size: Size(2, MySize.screenHeight / 10),
          ),
          Expanded(
            child: Padding(
              padding: Spacing.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan['name'],
                    overflow: TextOverflow.clip,
                    style: themeData.textTheme.headline6!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 16.0),
                  ),
                  Text(
                    plan['item_type'],
                    style: themeData.textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  double progress;
  Color color;
  Paint _paint;
  LinePainter({this.progress = 100, this.color = Colors.grey})
      : _paint = Paint() {
    this._paint
      ..color = this.color
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(25, 20);
    path.addOval(Rect.fromCircle(
      center: Offset(0, 0),
      radius: 5.0,
    ));
    path.moveTo(0, 2.5);
    path.lineTo(0, size.height);
    path.moveTo(0, size.height + 2.5);
    path.addOval(Rect.fromCircle(
      center: Offset(0, size.height + 2.5),
      radius: 5.0,
    ));
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

