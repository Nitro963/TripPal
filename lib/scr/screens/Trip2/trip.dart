import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/models/activites.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'componets/pagesIndecators.dart';
import 'package:travel_app/scr/models/DemoData.dart';
import 'package:intl/intl.dart';

Rx<int> selectedIndex = 0.obs;
PageController controller = PageController();

class TripPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 4,
            title: Text("Trip Details Plan",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800])),
            centerTitle: true,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {})),
        body: Center(
            child: ListView(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
            child: Obx(() => PagesIndecators(
                  controller: controller,
                  index: selectedIndex.value,
                  days: days,
                )),
          ),
          SizedBox(
            height: 16,
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 800,
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  selectedIndex.value = index;
                },
                children: [
                  ListView.builder(
                      itemCount: days[selectedIndex.value].activates.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: index == 0
                              ? const EdgeInsets.only(top: 8)
                              : const EdgeInsets.only(top: 2.5),
                          child: CustomStepper(
                            plan: days[selectedIndex.value].activates[index],
                            
                          ),
                        );
                      }),
                  ListView.builder(
                      itemCount: days[selectedIndex.value].activates.length,
                      itemBuilder: (context, index) {
                        return CustomStepper(
                          plan: days[selectedIndex.value].activates[index],
                        );
                      }),
                ],
              ),
            ),
          )
        ])));
  }
}

class CustomStepper extends StatelessWidget {
  final Acitvites plan;
  final Size size;
  CustomStepper({this.plan, this.size = const Size(100, 100)});
  @override
  Widget build(BuildContext context) {
    SizeConfig.init();
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            SizedBox(
              width: SizeConfig.blockSizeHorizontal * 20,
              child: Text(plan.time.format(context),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 32.0),
              child: CustomPaint(
                painter: LinePainter(100.0, Colors.green),
                size: Size(2, size.height),
              ),
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal * 60,
              height: size.height,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(plan.activity, style: TextStyle(fontSize: 24)),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(plan.details),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

class Plan {
  String title;
  String subTitle;
  TimeOfDay timeOfDay;
  Plan({this.title, this.subTitle, this.timeOfDay});
}

class LinePainter extends CustomPainter {
  double progress;
  Color color;
  Paint _paint;
  LinePainter(progress, color) {
    this.progress = progress ?? 100.0;
    this.color = color ?? Colors.grey;
    this._paint = Paint()
      ..color = color
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
