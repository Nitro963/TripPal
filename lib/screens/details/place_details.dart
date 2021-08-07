import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:readmore/readmore.dart';
import 'package:trip_pal_null_safe/controllers/app_theme_controller.dart';
import 'package:trip_pal_null_safe/controllers/details_controller.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/themes.dart';
import 'package:trip_pal_null_safe/widgets/animated/stars.dart';
import 'package:trip_pal_null_safe/widgets/simple/avatar_overflow.dart';
import 'package:trip_pal_null_safe/widgets/simple/image_card.dart';
import 'package:trip_pal_null_safe/widgets/simple/place_image_card.dart';

// TODO add a details controller to read data from the server based on navigation parameters passed from Get
class PlaceDetails extends StatelessWidget {
  final placesFigures = [
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
    'assets/images/8.jpg'
  ];
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
              expandedHeight: 2.5 * MySize.screenHeight / 5,
              leading: BackButton(color: Colors.white),
              backgroundColor: Themes.getDetailsAppBarColorFromThemeMode(
                  Get.find<AppThemeController>().themeMode),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Bali',
                  style: Get.theme.textTheme.headline6!
                      .copyWith(color: Colors.white),
                ),
                centerTitle: true,
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/$headerImage',
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
                IconButton(
                  icon: Icon(Icons.location_pin, color: Colors.white),
                  onPressed: () {
                    // Get.to(
                    //   MapPage(
                    //       latitude: 41.015182,
                    //       longitude: 28.951982,
                    //       placeName: 'Bali'),
                    // );
                  },
                )
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
    Key? key,
    required this.placesFigures,
    required this.placesNames,
  }) : super(key: key);

  final List<String> placesFigures;
  final List<String> placesNames;
  final List<String> pictures = [
    'assets/images/14.jpg',
    'assets/images/15.jpg',
    'assets/images/16.jpg',
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
              Text('Bali',
                  style: theme.textTheme.headline6!
                      .copyWith(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              // StaticStars(active: 3),
              StarRating(isStatic: true, rating: 3),
              SizedBox(height: 20),
              AvatarOverFlowView(onTap: () {
                Get.toNamed('/reviews');
              }),
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
                      Get.toNamed('/review-writing');
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
    // TODO read from server
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Properties',
            style: theme.textTheme.headline6!
                .copyWith(fontSize: 24, fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Free Wifi'),
              Text('Pool'),
              Text('Bar'),
              Text('Air conditioning'),
              Text('Daily housekeeping'),
              Text('Garden'),
              Text('Multilingual staff'),
              Text('Concierge services'),
              Text('6 meeting rooms'),
            ],
          ),
        ),
      ],
    );
  }

  Column buildSimilarPlacesSection(ThemeData theme) {
    // TODO read from server
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Places like Bali',
            style: theme.textTheme.headline6!
                .copyWith(fontSize: 24, fontWeight: FontWeight.bold)),
        Padding(
          padding: Spacing.vertical(20),
          child: Container(
            height: MySize.getScaledSizeHeight(200),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // TODO add on Tap parameter
                  return PlaceImageCard(
                    placesFigures[index],
                    placesNames[index],
                    MySize.getScaledSizeHeight(200),
                    MySize.getScaledSizeWidth(180),
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
    // TODO read from server
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pictures',
            style: theme.textTheme.headline6!
                .copyWith(fontSize: 24, fontWeight: FontWeight.bold)),
        // Staggered Grid
        Container(
          height: MySize.getScaledSizeHeight(400),
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
