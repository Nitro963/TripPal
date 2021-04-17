import 'dart:math';

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
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
                pinned: true, delegate: PlaceDetailsDelegate(data1)),
            // SliverList(
            //     delegate: SliverChildBuilderDelegate((context, index) {
            //   return DetailsContainer(data: data, dataNames: dataNames);
            // }, childCount: 2)),
            SliverToBoxAdapter(
                child: DetailsContainer(data: data, dataNames: dataNames))
          ],
        ));
  }
}

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({
    Key key,
    @required this.data,
    @required this.dataNames,
  }) : super(key: key);

  final List<String> data;
  final List<String> dataNames;

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
                  colorClickableText: Theme.of(context).primaryColor,
                  trimMode: TrimMode.Length,
                  trimCollapsedText: '...Read more',
                  trimExpandedText: ' Less'),
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
                          SizeConfig.blockSizeHorizontal * 28,
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
    );
  }
}

class PlaceDetailsDelegate extends SliverPersistentHeaderDelegate {
  final data;
  final controller = PageController();
  PlaceDetailsDelegate(this.data);

  double appBarOpacity(double shrinkOffset) {
    return min(1, max(0.0, shrinkOffset) / (maxExtent - minExtent));
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
        leading: BackButton(
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: SizeConfig.blockSizeVertical * 56,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: controller,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    'images/${data[index]}',
                    fit: BoxFit.cover,
                    color: Theme.of(context)
                        .primaryColor
                        .withOpacity(appBarOpacity(shrinkOffset)),
                    colorBlendMode: BlendMode.xor,
                  );
                }),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 54,
            left: SizeConfig.blockSizeHorizontal * 40,
            child: SmoothPageIndicator(
              controller: controller,
              count: data.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.white,
                dotWidth: 15,
                dotHeight: 4,
                spacing: 3,
              ),
            ),
          ),
        ],
      ),
    );
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

// Positioned(
//   top: SizeConfig.blockSizeVertical * 10,
//   child: Padding(
//     padding: EdgeInsets.symmetric(
//         horizontal: 15, vertical: 15),
//     child: Text('Place details',
//         style: Theme.of(context)
//             .primaryTextTheme
//             .headline2
//             .copyWith(color: Colors.white)),
//   ),
// ),
