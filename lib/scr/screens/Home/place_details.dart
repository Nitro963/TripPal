import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:readmore/readmore.dart';
import 'package:travel_app/scr/screens/review_writing.dart';

import 'package:travel_app/scr/shared/constants.dart';
import 'package:travel_app/scr/widgets/avatar_overflow.dart';
import 'package:travel_app/scr/widgets/place_card.dart';
import 'package:travel_app/scr/widgets/stars.dart';

class PlaceDetails extends StatelessWidget {
  final placesFigures = ['5.jpg', '6.jpg', '7.jpg', '8.jpg'];
  final placesNames = ['Vienna', 'Venice', 'Scotland', 'Berlin'];
  final headerImage = '13.jpg';

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
                pinned: true, delegate: PlaceDetailsDelegate(headerImage)),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return DetailsContainer(
                  placesFigures: placesFigures, placesNames: placesNames);
            }, childCount: 2)),
            // SliverToBoxAdapter(
            //     child: DetailsContainer(data: data, dataNames: dataNames))
          ],
        ));
  }
}

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({
    Key key,
    @required this.placesFigures,
    @required this.placesNames,
  }) : super(key: key);

  final List<String> placesFigures;
  final List<String> placesNames;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bali', style: Theme.of(context).textTheme.headline1),
              StaticStars(active: 3),
              SizedBox(height: 18),
              AvatarOverFlowView(),
              SizedBox(height: 18),
              ReadMoreText(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan a',
                colorClickableText: Theme.of(context).primaryColor,
                trimMode: TrimMode.Length,
                trimCollapsedText: '...Read more',
                trimExpandedText: ' Less',
              ),
              SizedBox(height: 3),
              Align(
                alignment: Alignment.centerRight,
                child: CupertinoButton(
                    child: Text(
                      'Write a review',
                      style: TextStyle(
                        color: const Color(0xffffaa00),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReviewWriting()),
                      );
                    }),
              ),
              // SizedBox(height: 10),
              // Text('Properties',
              //     style: Theme.of(context)
              //         .primaryTextTheme
              //         .headline3
              //         .copyWith(color: Colors.black)),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text('Wifi'),
              //         Text('Pool'),
              //         Text('Bar'),
              //         Text('Air conditioning'),
              //         Text(''),
              //         Text(''),
              //         Text(''),
              //         Text(''),
              //         Text(''),
              //       ]),
              // ),
              SizedBox(height: 10),
              Text('Places like Bali',
                  style: Theme.of(context).textTheme.headline3),
              SizedBox(height: 20),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 12,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return PlaceCard(
                          placesFigures[index],
                          SizeConfig.blockSizeHorizontal * 28,
                          placesNames[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 15);
                    },
                    itemCount: placesFigures.length),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PlaceDetailsDelegate extends SliverPersistentHeaderDelegate {
  final String headerImage;
  PlaceDetailsDelegate(this.headerImage);

  double appBarOpacity(double shrinkOffset) {
    return math.min(1, math.max(0.0, shrinkOffset) / (maxExtent - minExtent));
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Theme.of(context)
              .primaryColor
              .withOpacity(appBarOpacity(shrinkOffset)),
          // title: Text(
          //   'Bali',
          //   style: Theme.of(context).primaryTextTheme.headline1.copyWith(
          //       color: Colors.white.withOpacity(appBarOpacity(shrinkOffset))),
          // ),
        ),
        body: Image.asset(
          'images/$headerImage',
          width: double.infinity,
          height: SizeConfig.blockSizeVertical * 56,
          fit: BoxFit.cover,
          color: Theme.of(context)
              .primaryColor
              .withOpacity(appBarOpacity(shrinkOffset)),
          colorBlendMode: BlendMode.xor,
        ));
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => SizeConfig.blockSizeVertical * 56;
  @override
  // TODO: implement minExtent
  double get minExtent => SizeConfig.blockSizeVertical * 10.5;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
