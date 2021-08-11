import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:trip_pal_null_safe/controllers/app_theme_controller.dart';
import 'package:trip_pal_null_safe/controllers/trip_planning_controller.dart';
import 'package:trip_pal_null_safe/models/activities.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/themes.dart';
import 'package:trip_pal_null_safe/utilities/transformers.dart';
import 'package:trip_pal_null_safe/widgets/transformer_page_view/transformer_page_view.dart';
import '../../../dummy_data.dart';
import 'trip_plan_pages_indicators.dart';

class TripPlan extends GetView<TripPlanningController> {
  PreferredSizeWidget buildAppBar() {
    return PreferredSize(
      preferredSize: Size(MySize.screenWidth, MySize.getScaledSizeHeight(180)),
      child: Column(
        children: [
          AppBar(
            title: Text("Trip Plan Details"),
            centerTitle: true,
            backgroundColor: Get.theme.backgroundColor,
            elevation: 0,
            actions: [
              IconButton(
                  icon: Icon(Icons.edit_location_outlined),
                  onPressed: () {
                    // TODO edit mode
                  })
            ],
          ),
          Expanded(
            child: Padding(
              padding: Spacing.fromLTRB(16, 4, 16, 32),
              child: PagesIndicators(
                index: controller.selectedIndex,
                days: days,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final customTheme =
        Themes.getCustomAppTheme(Get.find<AppThemeController>().themeMode);
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: TransformerPageView(
                pageController: controller.pageController,
                physics: BouncingScrollPhysics(),
                itemCount: days.length,
                duration: Duration(seconds: 1),
                onPageChanged: (index) {
                  controller.selectedIndex = index;
                },
                transformer: ZoomInPageTransformer(),
                itemBuilder: (context, pageIndex) {
                  return ListView.builder(
                      itemCount: days[pageIndex].activates.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: index == 0
                              ? Spacing.only(top: 8)
                              : Spacing.only(top: 2.5),
                          child: CustomStepper(
                            plan:
                                days[controller.selectedIndex].activates[index],
                            lineColor: days[controller.selectedIndex]
                                    .activates[index]
                                    .time
                                    .isBefore(DateTime.now())
                                ? customTheme.colorInfo
                                : customTheme.disabledColor,
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}

class CustomStepper extends StatelessWidget {
  final Activity plan;
  final Color lineColor;
  final timeFormatter = intl.DateFormat("hh:mm a");
  CustomStepper({required this.plan, this.lineColor = Colors.grey});
  @override
  Widget build(BuildContext context) {
    final themeData = Get.theme;
    return Padding(
      padding: Spacing.symmetric(horizontal: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MySize.size80,
            child: Text(timeFormatter.format(plan.time),
                maxLines: 1,
                textAlign: TextAlign.center,
                style:
                    themeData.textTheme.subtitle2!.copyWith(color: lineColor)),
          ),
          SizedBox(width: 10),
          CustomPaint(
            painter: LinePainter(progress: 100.0, color: lineColor),
            size: Size(2, MySize.screenHeight / 7),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  plan.activity,
                  style: themeData.textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  plan.details,
                  style: themeData.textTheme.subtitle1,
                ),
              ],
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
