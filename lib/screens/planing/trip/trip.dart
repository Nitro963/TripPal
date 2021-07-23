// TODO either migrate the library to null safety or use other solutions
// import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:cron/cron.dart';
import 'package:trip_pal_null_safe/models/activities.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import '../../../dummy_data.dart';
import 'trip_plan_pages_indecators.dart';

// TODO never make an observable datetime. Convert to GetView and user the same logic in HotelSearchPage
class TripPlan extends StatelessWidget {
  final RxInt selectedIndex = 0.obs;
  final PageController controller = PageController();
  final Rx<DateTime> time = DateTime.now().obs;

  @override
  Widget build(BuildContext context) {
    // What the hell is this?!
    //Toggle Time Event for the date Every 5 minutes
    final cron = Cron()
      ..schedule(Schedule.parse('*/5 * * * *'), () async {
        time.value = DateTime.now();
      });
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
              child: Obx(() => PagesIndicators(
                    controller: controller,
                    index: selectedIndex.value,
                    days: days,
                  )),
            ),
            SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                height: 800,
                child: Obx(
                  () => PageView(
                    controller: controller,
                    physics: BouncingScrollPhysics(),
                    onPageChanged: (index) {
                      selectedIndex.value = index;
                    },
                    children: [
                      // WHY WHY WHY
                      // Use Page builder :)
                      ListView.builder(
                          itemCount: days[selectedIndex.value].activates.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: index == 0
                                  ? const EdgeInsets.only(top: 8)
                                  : const EdgeInsets.only(top: 2.5),
                              child: CustomStepper(
                                  plan: days[selectedIndex.value]
                                      .activates[index],
                                  lineColor: days[selectedIndex.value]
                                          .activates[index]
                                          .time
                                          .isBefore(time.value)
                                      ? Get.theme.primaryColor
                                      : Colors.grey),
                            );
                          }),
                      ListView.builder(
                          itemCount: days[selectedIndex.value].activates.length,
                          itemBuilder: (context, index) {
                            return CustomStepper(
                                plan:
                                    days[selectedIndex.value].activates[index],
                                lineColor: days[selectedIndex.value]
                                        .activates[index]
                                        .time
                                        .isBefore(time.value)
                                    ? Get.theme.primaryColor
                                    : Colors.grey);
                          }),
                    ],
                  ),
                ),
              ),
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
  final Size size;
  final Color lineColor;
  CustomStepper(
      {required this.plan,
      this.lineColor = Colors.grey,
      this.size = const Size(100, 100)});
  @override
  Widget build(BuildContext context) {
    MySize.init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Text(intl.DateFormat("hh:mm a").format(plan.time),
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 6, right: 12.0),
            child: CustomPaint(
              painter: LinePainter(progress: 100.0, color: lineColor),
              size: Size(2, size.height),
            ),
          ),
          SizedBox(
            width: MySize.getScaledSizeWidth(220),
            height: size.height,
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
