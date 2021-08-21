import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/apps_controllers.dart';
import 'package:trip_pal_null_safe/controllers/model_list_view_controller.dart';
import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/models/tag.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/extendable/model_view.dart';
import 'package:trip_pal_null_safe/widgets/simple/blend_shimmer_image.dart';

class TagsListView extends IModelView {
  @override
  IModelViewController<Tag> get controller => Get.find<TagsListController>();

  @override
  Widget buildViewTile(int index, IModel model, BuildContext context) {
    final themeData = Get.theme;
    final category = model as Tag;
    return GestureDetector(
      onTap: () {
        // TODO navigate to filtered blog view
        // Get.toNamed('/home/screens.apps/products?category_id=${category.id}');
      },
      child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size16)),
          child: Stack(
            children: <Widget>[
              BlendShimmerImage(
                imageUrl: category.image!,
                height: MySize.getScaledSizeHeight(160),
                boxFit: BoxFit.cover,
                width: MySize.screenWidth,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withAlpha(150),
                  padding: EdgeInsets.only(
                      left: MySize.size16,
                      right: MySize.size16,
                      top: MySize.size8,
                      bottom: MySize.size8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          model.name!,
                          overflow: TextOverflow.ellipsis,
                          style: themeData.textTheme.subtitle1!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${category.blogCount}',
                            style: themeData.textTheme.bodyText1!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.2),
                          ),
                          Text(
                            ' ' + 'Blog'.tr,
                            style: themeData.textTheme.bodyText1!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.2),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  @override
  IconData get tileIcon => Icons.edit;

  @override
  String get title => 'Tags';
}
