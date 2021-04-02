import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/scr/screens/review_writing.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:travel_app/scr/widgets/ReviewsBarChart.dart';
import 'package:travel_app/scr/widgets/review_card.dart';
// import 'package:travel_app/scr/widgets/stars.dart';

class Reviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(
              onPressed: () {
                print("return");
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Reviews',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(color: const Color(0xff24253d))),
                          CupertinoButton(
                              child: Row(
                                children: [
                                  Text(
                                    'Write a review',
                                    style: TextStyle(
                                      color: const Color(0xffffaa00),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Icon(Icons.arrow_forward_ios,
                                      size: 17, color: const Color(0xffffaa00)),
                                ],
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReviewWriting()),
                                );
                              })
                        ],
                      ),
                    ),
                    Row(
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
                                  color: const Color(0xff8c8c98), fontSize: 15),
                            ),
                          ]),
                          //bar chart
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                  height: SizeConfig.blockSizeVertical * 15,
                                  width: SizeConfig.blockSizeHorizontal * 60,
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

                          //total ratings
                        ]),
                    SizedBox(height: SizeConfig.blockSizeVertical * 6),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 17.0),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            ReviewCard(),
                            ReviewCard(),
                            ReviewCard(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
