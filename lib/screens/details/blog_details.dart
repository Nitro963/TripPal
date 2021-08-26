import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trip_pal_null_safe/controllers/blog_view_controller.dart';
import 'package:trip_pal_null_safe/services/auth_service.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/generator.dart';
import 'package:trip_pal_null_safe/widgets/extendable/model_details_view.dart';
import 'package:trip_pal_null_safe/widgets/simple/blend_shimmer_image.dart';
import 'package:trip_pal_null_safe/widgets/simple/image_dominant_color_cover.dart';

class BlogView extends DetailsScaffold {
  BlogViewController get controller => Get.find<BlogViewController>();

  Widget buildHeaderStack(ThemeData themeData) {
    return Container(
      height: 2.6 * MySize.screenHeight / 5 +
          2 * MediaQuery.of(Get.context!).padding.top,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: Shape.circularBottom(40),
              boxShadow: [
                BoxShadow(
                  color: themeData.cardTheme.shadowColor!.withAlpha(32),
                  blurRadius: 4,
                  offset: Offset(2, 10), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: Shape.circularBottom(40),
              child: BlendShimmerImage(
                imageUrl: controller.blog.image!,
                // color: Colors.,
                // colorBlendMode: BlendMode.darken,
                boxFit: BoxFit.fill,
                width: MySize.screenWidth,
                height: double.infinity,
              ),
            ),
          ),
          ImageDominantColorCover(
              provider: CachedNetworkImageProvider(controller.blog.image!),
              borderRadius: Shape.circularBottom(40)),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: Column(
                children: [
                  Card(
                    margin: Spacing.only(left: 30, top: 40),
                    elevation: 5,
                    shape:
                        Shape.circular(12, shapeTypeFor: ShapeTypeFor.button),
                    child: InkWell(
                      borderRadius: Shape.circular(8),
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: Spacing.all(9),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: MySize.size28,
                          color: themeData.colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin: Spacing.only(left: 30, top: 20),
                    shape:
                        Shape.circular(12, shapeTypeFor: ShapeTypeFor.button),
                    elevation: 5,
                    child: Column(
                      children: [
                        SizedBox(height: MySize.size4),
                        InkWell(
                          borderRadius: Shape.circular(8),
                          onTap: () {},
                          child: Padding(
                            padding: Spacing.all(12),
                            child: Icon(
                              MdiIcons.facebookMessenger,
                              size: MySize.size24,
                              color: themeData.colorScheme.onBackground,
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: Shape.circular(8),
                          onTap: () {},
                          child: Padding(
                            padding: Spacing.all(12),
                            child: Icon(
                              FontAwesomeIcons.facebookF,
                              size: MySize.size24,
                              color: themeData.colorScheme.onBackground,
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: Shape.circular(8),
                          onTap: () {},
                          child: Padding(
                            padding: Spacing.all(12),
                            child: Icon(
                              FontAwesomeIcons.twitter,
                              size: MySize.size24,
                              color: themeData.colorScheme.onBackground,
                            ),
                          ),
                        ),
                        SizedBox(height: MySize.size4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (controller.blog.user == Get.find<AuthControl>().currentUser)
            Align(
              alignment: Alignment.topRight,
              child: SafeArea(
                child: InkWell(
                  borderRadius: Shape.circular(8),
                  onTap: () {
                    // TODO edit mode
                  },
                  child: Padding(
                    padding: Spacing.all(9),
                    child: Icon(
                      Icons.edit,
                      size: MySize.size28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          Positioned(
            left: 20,
            bottom: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: MySize.screenWidth / 3),
                  child: Text(
                    controller.blog.title!,
                    style: themeData.textTheme.headline3!.copyWith(
                        color: Colors.white.withOpacity(0.85),
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                Space.height(24),
                Text(
                  'By: ${controller.blog.user!.name}',
                  style: themeData.textTheme.headline5!.copyWith(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                Space.height(48),
                Center(
                  child: Container(
                    height: MySize.size6,
                    width: 2 * MySize.screenWidth / 5,
                    margin: Spacing.bottom(24),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.8),
                      borderRadius: Shape.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
  }

  @override
  Widget buildBody() {
    final themeData = Get.theme;
    return Column(
      children: [
        buildHeaderStack(themeData),
        Expanded(
          child: Container(
            margin: Spacing.all(24),
            child: Column(
              children: [
                Padding(
                  padding: Spacing.horizontal(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Let\'s Begin Read',
                          style: themeData.textTheme.subtitle2!
                              .copyWith(fontSize: 12)),
                      Text('End',
                          style: themeData.textTheme.subtitle2!
                              .copyWith(fontSize: 12)),
                    ],
                  ),
                ),
                Padding(
                  padding: Spacing.only(top: 8, bottom: 12),
                  child: Obx(() => Generator.buildProgress(
                        width: MySize.screenWidth - 24,
                        activeColor: themeData.primaryColor,
                        progress: controller.progress,
                      )),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    physics: BouncingScrollPhysics(),
                    child: Text(
                      controller.blog.blogText!,
                      style: themeData.textTheme.bodyText1,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
