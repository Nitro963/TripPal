import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/scr/screens/review_writing.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:travel_app/scr/widgets/ReviewsBarChart.dart';
import 'package:travel_app/scr/widgets/review_card.dart';

// import 'package:travel_app/scr/widgets/stars.dart';
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
  Widget build(BuildContext context) {
    SizeConfig.init(context);
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReviewWriting()));
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
                                        color: const Color(0xffffaa00),
                                        fontSize: 60)),
                                Text(
                                  'out of 5',
                                  style: TextStyle(
                                      color: const Color(0xff8c8c98),
                                      fontSize: 15),
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
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: const Color(0xff024253d))),
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
                                  child: ReviewCard()),
                            ),
                          ),
                        );
                      }),
                )
              ]),
        ));
  }
}
