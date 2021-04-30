import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:readmore/readmore.dart';
import 'package:travel_app/scr/screens/Reviews/review_writing.dart';
import 'package:travel_app/scr/shared/Constants/constants.dart';
import 'package:travel_app/scr/shared/Widgets/avatar_overflow.dart';
import 'package:travel_app/scr/shared/Widgets/stars.dart';

import 'Componenet/image_card.dart';
import 'Componenet/place_card.dart';

class PlaceDetails extends StatelessWidget {
  final placesFigures = ['5.jpg', '6.jpg', '7.jpg', '8.jpg'];
  final placesNames = ['Vienna', 'Venice', 'Scotland', 'Berlin'];
  final headerImage = '13.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: false,
              pinned: true,
              expandedHeight: SizeConfig.blockSizeVertical * 51,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Bali',
                ),
                centerTitle: true,
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'images/$headerImage',
                      fit: BoxFit.cover,
                    ),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, 0.5),
                          end: Alignment(0.0, 0.0),
                          colors: <Color>[
                            Color(0x60000000),
                            Color(0x00000000),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(icon: Icon(Icons.location_pin), onPressed: () {})
              ],
            ),
            // SliverList(
            //     delegate: SliverChildBuilderDelegate((context, index) {
            //   return DetailsContainer(
            //       placesFigures: placesFigures, placesNames: placesNames);
            // }, childCount: 2)),
            SliverToBoxAdapter(
                child: DetailsContainer(
                    placesFigures: placesFigures, placesNames: placesNames))
          ],
        ));
  }
}

class DetailsContainer extends StatelessWidget {
  DetailsContainer({
    Key key,
    @required this.placesFigures,
    @required this.placesNames,
  }) : super(key: key);

  final List<String> placesFigures;
  final List<String> placesNames;
  final List<String> pictures = [
    '14.jpg',
    '15.jpg',
    '16.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(left: 15.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bali', style: theme.textTheme.headline1),
              SizedBox(height: 5),
              StaticStars(active: 3),
              SizedBox(height: 20),
              AvatarOverFlowView(),
              SizedBox(height: 20),
              ReadMoreText(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan a',
                colorClickableText: theme.primaryColor,
                trimMode: TrimMode.Length,
                trimCollapsedText: '...Read more',
                trimExpandedText: ' Less',
                style: theme.textTheme.bodyText2,
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
                      Get.to(ReviewWriting());
                    }),
              ),
              buildPropertiesSection(theme),
              SizedBox(height: 20),
              buildPicturesSection(theme),
              SizedBox(height: 20),
              buildSimilarPlacesSection(theme),
            ],
          ),
        ],
      ),
    );
  }

  Column buildPropertiesSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Properties', style: theme.textTheme.headline2),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Free Wifi'),
            Text('Pool'),
            Text('Bar'),
            Text('Air conditioning'),
            Text('Daily housekeeping'),
            Text('Garden'),
            Text('Multilingual staff'),
            Text('Concierge services'),
            Text('6 meeting rooms'),
          ]),
        ),
      ],
    );
  }

  Column buildSimilarPlacesSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Places like Bali', style: theme.textTheme.headline2),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            height: SizeConfig.blockSizeVertical * 20,
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return PlaceCard(
                    placesFigures[index],
                    placesNames[index],
                    SizeConfig.blockSizeVertical * 20,
                    SizeConfig.blockSizeHorizontal * 42,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 15);
                },
                itemCount: placesFigures.length),
          ),
        ),
      ],
    );
  }

  Column buildPicturesSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pictures', style: theme.textTheme.headline2),
        // Staggered Grid
        Container(
          height: SizeConfig.blockSizeVertical * 51,
          child: StaggeredGridView.countBuilder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            physics: BouncingScrollPhysics(),
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 10,
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(index == 0 ? 2 : 1, 1),
            itemBuilder: (context, index) => new ImageCard(
              pictures[index],
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ),
      ],
    );
  }
}
