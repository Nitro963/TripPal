import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/screens/Reviews/review_writing.dart';
import 'package:travel_app/scr/shared/Constants/constants.dart';

import 'Components/ReviewsBarChart.dart';
import 'Components/review_card.dart';

class Reviews extends StatefulWidget {
  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  final controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      var value = controller.offset / 147;
      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          // shadowColor: Colors.transparent,
          // leading: BackButton(
          //   color: Colors.black,
          // ),
          title: Text('Reviews'),
          actions: [
            IconButton(
              icon: Icon(FontAwesomeIcons.edit),
              onPressed: () {
                Get.to(ReviewWriting());
              },
            )
          ],
        ),
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  opacity: closeTopContainer ? 0 : 1,
                  child: AnimatedContainer(
                      width: SizeConfig.screenWidth,
                      height: closeTopContainer
                          ? 0
                          : SizeConfig.blockSizeVertical * 20,
                      alignment: Alignment.topCenter,
                      duration: Duration(milliseconds: 200),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(children: [
                                Text('4.5',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xffffaa00),
                                        fontSize: 60)),
                                Text(
                                  'out of 5',
                                  style: Get.textTheme.headline3
                                      .copyWith(color: const Color(0xff8c8c98)),
                                ),
                              ]),
                              SizedBox(width: 35),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                      height: SizeConfig.blockSizeVertical * 15,
                                      width:
                                          SizeConfig.blockSizeHorizontal * 60,
                                      child: ReviewsBarChart.withSampleData()),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Total Rating 25',
                                        style: Get.textTheme.subtitle2.copyWith(
                                            fontWeight: FontWeight.normal,
                                            color: const Color(0xff24253d))),
                                  ),
                                ],
                              ),
                            ]),
                      )),
                ),
                Expanded(
                  child: ListView.builder(
                      controller: controller,
                      physics: BouncingScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.9 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) scale = 1;
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform: Matrix4.identity()..scale(scale, scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                              heightFactor: 0.7,
                              alignment: Alignment.topCenter,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 17.0),
                                  child: ReviewCard(
                                    onPressed:
                                        scale.floor() == 1 ? () {} : null,
                                  )),
                            ),
                          ),
                        );
                      }),
                )
              ]),
        ));
  }
}
