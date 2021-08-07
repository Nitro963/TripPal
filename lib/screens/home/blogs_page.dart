import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

typedef ItemBuilder = Widget Function(BuildContext context, int index);

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                  icon: Icon(Icons.menu, size: MySize.size24),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  }),
            ],
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                buildSectionOne(),
                buildSectionTwo(),
                buildTagSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHorizontalSection(
      Widget header, int itemCount, ItemBuilder builder,
      {double separatorWidth = 8}) {
    assert(itemCount != 0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        header,
        Expanded(
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: builder,
              separatorBuilder: (context, index) => Space.width(separatorWidth),
              itemCount: itemCount),
        )
      ],
    );
  }

  Widget buildSectionOne() {
    final themeData = Get.theme;
    return Container(
      height: MySize.getScaledSizeHeight(190),
      padding: Spacing.fromLTRB(0, 8, 0, 0),
      child: buildHorizontalSection(
        Padding(
          padding: Spacing.fromLTRB(24, 0, 0, 0),
          child: Text('Blogger\'s Of The Week',
              style: themeData.textTheme.headline6),
        ),
        10,
        (context, index) => Padding(
          padding: Spacing.fromLTRB(index == 0 ? 32 : 0, 0, 0, 0),
          child: Column(
            children: [
              Space.height(10),
              ClipOval(
                child: InkWell(
                  onTap: () {},
                  borderRadius:
                      BorderRadius.circular(MySize.getScaledSizeHeight(80)),
                  child: Stack(
                    children: [
                      FancyShimmerImage(
                        // TODO read user profile pic
                        imageUrl:
                            "https://loremflickr.com/320/320/user?random=2",
                        width: MySize.getScaledSizeHeight(80),
                        height: MySize.getScaledSizeHeight(80),
                        boxFit: BoxFit.cover,
                        errorWidget: Container(
                          color: themeData.colorScheme.surface,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(MdiIcons.alert, color: Get.theme.errorColor),
                              Text('Error',
                                  style: themeData.textTheme.caption!
                                      .copyWith(color: Get.theme.errorColor))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MySize.getScaledSizeHeight(80),
                        height: MySize.getScaledSizeHeight(80),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.white54, width: MySize.size4),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Space.height(4),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Nathan',
                      style: themeData.textTheme.subtitle2!.copyWith(
                        color: themeData.textTheme.subtitle2!.color!
                            .withAlpha(120),
                      ),
                    ),
                    Space.height(2),
                    Text(
                      'Amsterdum',
                      style: themeData.textTheme.subtitle2!.copyWith(
                        color: themeData.textTheme.subtitle2!.color!
                            .withAlpha(120),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionTwo() {
    final themeData = Get.theme;
    return Container(
      height: MySize.getScaledSizeHeight(420),
      padding: Spacing.fromLTRB(0, 16, 0, 0),
      child: buildHorizontalSection(
        Padding(
          padding: Spacing.fromLTRB(24, 0, 0, 0),
          child: Text('Fresh Inspiring Story\'s',
              style: Get.theme.textTheme.headline6),
        ),
        8,
        (context, index) => Padding(
          padding: Spacing.fromLTRB(index == 0 ? 24 : 0, 0, 0, 0),
          child: Column(
            children: [
              Space.height(16),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: Shape.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: themeData.cardTheme.shadowColor!.withAlpha(32),
                        blurRadius: 4,
                        offset: Offset(2, 6), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      ClipRRect(
                        borderRadius: Shape.circular(20),
                        child: Image.asset(
                          'assets/images/wl-mod-4.jpg',
                          color: Colors.black38,
                          colorBlendMode: BlendMode.darken,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            constraints: BoxConstraints.loose(
                              Size.fromWidth(
                                MySize.getScaledSizeWidth(200),
                              ),
                            ),
                            margin: Spacing.fromLTRB(10, 0, 0, 24),
                            child: Text(
                              'Traveling Solo and Loving it',
                              style: themeData.textTheme.headline3!.copyWith(
                                  color: Colors.white.withOpacity(0.85),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              Space.height(10),
            ],
          ),
        ),
        separatorWidth: 24,
      ),
    );
  }

  Widget buildTagSection() {
    final themeData = Get.theme;
    return Container(
      padding: Spacing.fromLTRB(24, 16, 48, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: Spacing.only(bottom: 16),
            child: Text('What Do You Want To Read?',
                style: themeData.textTheme.headline6),
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 7 / 2,
                crossAxisSpacing: MySize.size24,
                mainAxisSpacing: MySize.size24),
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => Card(
              shape: Shape.circular(12, shapeTypeFor: ShapeTypeFor.button),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: themeData.colorScheme.onBackground,
                  border:
                      Border.all(width: MySize.size4, color: Colors.white54),
                ),
                child: Center(
                  child: Text('Forest',
                      style: themeData.textTheme.headline6!
                          .copyWith(color: themeData.colorScheme.surface)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// Stack(
// children: [
// ClipRRect(
//   borderRadius: BorderRadius.circular(12),
//   child: FancyShimmerImage(
//     imageUrl:
//         "https://loremflickr.com/320/320/forest?random=2",
//     boxFit: BoxFit.cover,
//     errorWidget: Container(
//       color: themeData.colorScheme.onBackground,
//     ),
//   ),
// ),
// ],
// ),
