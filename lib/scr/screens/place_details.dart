import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/scr/screens/review_writing.dart';

import 'package:travel_app/scr/shared/constants.dart';
import 'package:travel_app/scr/widgets/avatar_overflow.dart';
import 'package:travel_app/scr/widgets/place_card.dart';
import 'package:travel_app/scr/widgets/stars.dart';

class PlaceDetails extends StatelessWidget {
  final data = ['5.jpg', '6.jpg', '7.jpg', '8.jpg'];
  final dataNames = ['Vienna', 'Venice', 'Scotland', 'Berlin'];
  final data1 = ['13.jpg', '14.jpg'];

  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        extendBody: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: SizeConfig.blockSizeVertical * 56,
                              child: PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  controller: controller,
                                  itemCount: data1.length,
                                  itemBuilder: (context, index) {
                                    return Image.asset('images/${data1[index]}',
                                        fit: BoxFit.cover);
                                  }),
                            ),
                            Positioned(
                              top: SizeConfig.blockSizeVertical * 10,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: Text('Place details',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline2
                                        .copyWith(color: Colors.white)),
                              ),
                            ),
                            Positioned(
                              top: SizeConfig.blockSizeVertical * 54,
                              left: SizeConfig.blockSizeHorizontal * 40,
                              child: SmoothPageIndicator(
                                controller: controller,
                                count: data1.length,
                                effect: ExpandingDotsEffect(
                                  activeDotColor: Colors.white,
                                  dotWidth: 15,
                                  dotHeight: 4,
                                  spacing: 3,
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15.0, top: 10.0),
                          child: Column(
                            children: [
                              SizedBox(height: 25),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Bali',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline1
                                          .copyWith(color: Colors.black)),
                                  StaticStars(active: 3),
                                  SizedBox(height: 18),
                                  AvatarOverFlowView(),
                                  SizedBox(height: 18),
                                  ReadMoreText(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan a',
                                      colorClickableText:
                                          Theme.of(context).primaryColor,
                                      trimMode: TrimMode.Length,
                                      trimCollapsedText: '...Read more',
                                      trimExpandedText: ' Less'),
                                  SizedBox(height: 3),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CupertinoButton(
                                          child: Text(
                                            'Write a review',
                                            style: TextStyle(
                                              color: const Color(0xffffaa00),
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReviewWriting()),
                                            );
                                          })
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text('Places like Bali',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline3
                                          .copyWith(color: Colors.black)),
                                  SizedBox(height: 20),
                                  SizedBox(
                                    height: SizeConfig.blockSizeVertical * 12,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return PlaceCard(
                                              data[index],
                                              SizeConfig.blockSizeHorizontal *
                                                  28,
                                              dataNames[index]);
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(width: 15);
                                        },
                                        itemCount: data.length),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      top: SizeConfig.blockSizeVertical * 4,
                      child: BackButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
