import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trip_pal_null_safe/controllers/blogger_page_controller.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';
import 'package:trip_pal_null_safe/widgets/simple/blend_shimmer_image.dart';

typedef ItemBuilder = Widget Function(BuildContext context, int index);

class BlogPage extends GetView<BloggerPageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                  icon: Icon(Icons.menu,
                      size: MySize.size24,
                      color: Get.theme.appBarTheme.iconTheme!.color),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  }),
            ],
          ),
          Obx(
            () => Expanded(
              child: controller.hasData
                  ? RefreshIndicator(
                      onRefresh: controller.onRefresh,
                      child: Obx(
                        () => AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: !controller.empty
                              ? ListView(
                                  key: ValueKey(1),
                                  physics: AlwaysScrollableScrollPhysics(
                                      parent: BouncingScrollPhysics()),
                                  children: [
                                      buildSectionOne(),
                                      buildSectionTwo(),
                                      buildTagSection(),
                                    ])
                              : Stack(
                                  children: [
                                    Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(FontAwesomeIcons.newspaper,
                                              size: 80),
                                          Text('No Elements'),
                                        ],
                                      ),
                                    ),
                                    ListView(
                                        children: [],
                                        physics: AlwaysScrollableScrollPhysics(
                                            parent: BouncingScrollPhysics()))
                                  ],
                                ),
                        ),
                      ),
                    )
                  : Center(
                      child: !controller.hasError
                          ? CircularProgressIndicator()
                          : buildErrorContent(controller.errorModel!)),
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
    final items = controller.bloggerOfWeek;
    return items.length > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MySize.getScaledSizeHeight(180),
                padding: Spacing.fromLTRB(0, 8, 0, 0),
                child: buildHorizontalSection(
                  Padding(
                    padding: Spacing.fromLTRB(24, 0, 0, 0),
                    child: Text('Blogger\'s Of The Week',
                        style: themeData.textTheme.headline6),
                  ),
                  items.length,
                  (context, index) {
                    var item = items[index];
                    return Padding(
                      padding: Spacing.fromLTRB(index == 0 ? 32 : 0, 0, 0, 0),
                      child: Column(
                        children: [
                          Space.height(10),
                          ClipOval(
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(
                                    '/home/blog_page/list?user=${item.id}');
                              },
                              borderRadius: BorderRadius.circular(
                                  MySize.getScaledSizeHeight(80)),
                              child: Stack(
                                children: [
                                  BlendShimmerImage(
                                    imageUrl: item.profilePicture!,
                                    width: MySize.getScaledSizeHeight(80),
                                    height: MySize.getScaledSizeHeight(80),
                                    boxFit: BoxFit.cover,
                                    errorWidget: Container(
                                      color: themeData.colorScheme.surface,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(MdiIcons.alert,
                                              color: Get.theme.errorColor),
                                          Text('Error',
                                              style: themeData
                                                  .textTheme.caption!
                                                  .copyWith(
                                                      color:
                                                          Get.theme.errorColor))
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
                                          color: Colors.white54,
                                          width: MySize.size4),
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
                                  item.firstName!,
                                  style:
                                      themeData.textTheme.subtitle2!.copyWith(
                                    color: themeData.textTheme.subtitle2!.color!
                                        .withAlpha(120),
                                  ),
                                ),
                                Space.height(2),
                                Text(
                                  item.lastName!,
                                  style:
                                      themeData.textTheme.subtitle2!.copyWith(
                                    color: themeData.textTheme.subtitle2!.color!
                                        .withAlpha(120),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: Spacing.fromLTRB(23, 0, 0, 0),
                child: InkWell(
                    onTap: () {
                      Get.toNamed('/home/blog_page/users');
                    },
                    child: Text('Discover our awesome community!',
                        style: themeData.textTheme.subtitle2!
                            .copyWith(color: themeData.colorScheme.primary))),
              ),
            ],
          )
        : SizedBox.shrink();
  }

  Widget buildSectionTwo() {
    final themeData = Get.theme;
    final items = controller.freshBlog;
    return items.length > 0
        ? Container(
            height: MySize.getScaledSizeHeight(420),
            padding: Spacing.fromLTRB(0, 16, 0, 0),
            child: buildHorizontalSection(
              Padding(
                padding: Spacing.fromLTRB(24, 0, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fresh Inspiring Story\'s',
                        style: Get.theme.textTheme.headline6),
                    InkWell(
                        onTap: () {
                          Get.toNamed('/home/blog_page/list');
                        },
                        child: Text('Explore!',
                            style: themeData.textTheme.subtitle2!.copyWith(
                                color: themeData.colorScheme.primary)))
                  ],
                ),
              ),
              items.length,
              (context, index) {
                var item = items[index];
                return Padding(
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
                                color: themeData.cardTheme.shadowColor!
                                    .withAlpha(32),
                                blurRadius: 4,
                                offset:
                                    Offset(2, 6), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Stack(
                            fit: StackFit.passthrough,
                            children: [
                              ClipRRect(
                                borderRadius: Shape.circular(20),
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                        '/home/blog_page/blog?blog_id=${item.id}');
                                  },
                                  child: BlendShimmerImage(
                                    imageUrl: item.image!,
                                    boxFit: BoxFit.cover,
                                    color: Colors.black38,
                                    blendMode: BlendMode.darken,
                                  ),
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
                                      item.title!,
                                      style: themeData.textTheme.headline3!
                                          .copyWith(
                                              color: Colors.white
                                                  .withOpacity(0.85),
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
                );
              },
              separatorWidth: 24,
            ),
          )
        : SizedBox.shrink();
  }

  Widget buildTagSection() {
    final themeData = Get.theme;
    final items = controller.hotTags;
    return items.length > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
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
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        var item = items[index];
                        return Card(
                          shape: Shape.circular(12,
                              shapeTypeFor: ShapeTypeFor.button),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: themeData.colorScheme.onBackground,
                              border: Border.all(
                                  width: MySize.size4, color: Colors.white54),
                            ),
                            child: Center(
                              child: Text(item.name!,
                                  style: themeData.textTheme.headline6!
                                      .copyWith(
                                          color:
                                              themeData.colorScheme.surface)),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: Spacing.fromLTRB(24, 16, 8, 32),
                child: InkWell(
                    onTap: () {
                      Get.toNamed('/home/blog_page/tags');
                    },
                    child: Text('See what is trending!',
                        style: themeData.textTheme.subtitle2!
                            .copyWith(color: themeData.colorScheme.primary))),
              ),
            ],
          )
        : SizedBox.shrink();
  }
}
