import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trip_pal_null_safe/controllers/apps_controllers.dart';
import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/models/blog.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/extendable/model_view.dart';
import 'package:trip_pal_null_safe/widgets/simple/blend_shimmer_image.dart';

class BlogListView extends IModelGridView {
  @override
  BlogListViewController get controller => Get.find<BlogListViewController>();

  @override
  Widget buildViewTile(int index, IModel model, BuildContext context) {
    final themeData = Get.theme;
    final item = model as Blog;
    return Container(
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
            child: InkWell(
              onTap: () {
                Get.toNamed('/home/blog_page/blog?blog_id=${item.id}');
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
                  style: themeData.textTheme.headline3!.copyWith(
                      color: Colors.white.withOpacity(0.85),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ))
        ],
      ),
    );
  }

  @override
  IconData get tileIcon => MdiIcons.text;

  @override
  String get title => 'Blog';
}
