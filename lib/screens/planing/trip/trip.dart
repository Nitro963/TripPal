import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:trip_pal_null_safe/controllers/trip_planning_controller.dart';
import 'package:trip_pal_null_safe/models/activities.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import '../../../dummy_data.dart';
import 'trip_plan_pages_indecators.dart';

class TripPlan extends GetView<TripPlanningController> {
  @override
  Widget build(BuildContext context) {
    MySize.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Plan Details"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.edit_location_outlined),
              onPressed: () {
                // TODO edit mode
              })
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
              child: PagesIndicators(
                index: controller.selectedIndex.value,
                days: days,
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                  width: double.infinity,
                  height: 800,
                  child: PageView.builder(
                      controller: controller.pageController,
                      physics: BouncingScrollPhysics(),
                      itemCount: days.length,
                      onPageChanged: (index) {
                        controller.selectedIndex.value = index;
                      },
                      itemBuilder: (context, pageIndex) {
                        return ListView.builder(
                            itemCount: days[pageIndex].activates.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: index == 0
                                    ? const EdgeInsets.only(top: 8)
                                    : const EdgeInsets.only(top: 2.5),
                                child: CustomStepper(
                                  plan: days[controller.selectedIndex.value]
                                      .activates[index],
                                  lineColor:
                                      days[controller.selectedIndex.value]
                                              .activates[index]
                                              .time
                                              .isBefore(controller.time.value)
                                          ? Get.theme.primaryColor
                                          : Colors.grey,
                                  size: Size(double.infinity, MySize.size100),
                                ),
                              );
                            });
                      })),
            ),
          ],
        ),
      ),
    );
  }
}

// Bad implantation!
class CustomStepper extends StatelessWidget {
  final Activity plan;
  late final Size size;
  final Color lineColor;

  CustomStepper(
      {required this.plan, this.lineColor = Colors.grey, required this.size});
  @override
  Widget build(BuildContext context) {
    MySize.init(context);
    return SizedBox(
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            SizedBox(
              width: MySize.size100,
              child: Text(intl.DateFormat("hh:mm a").format(plan.time),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Get.theme.accentColor,
                    fontWeight: FontWeight.w300,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12.0),
              child: CustomPaint(
                painter: LinePainter(progress: 100.0, color: lineColor),
                size: Size(2, size.height),
              ),
            ),
            SizedBox(
              width: MySize.getScaledSizeWidth(220),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(plan.activity,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                          fontSize: 24)),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(plan.details,
                        style: TextStyle(
                            color: Get.theme.shadowColor,
                            fontWeight: FontWeight.w300)),
                  ),
                ],
              ),
            )
          ],
        ),
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
