import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trip_pal_null_safe/controllers/apps_controllers.dart';
import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/models/hotel.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/extendable/model_view.dart';
import 'package:trip_pal_null_safe/widgets/simple/blend_shimmer_image.dart';

class HotelsView extends IModelView {
  @override
  HotelsViewController get controller => Get.find<HotelsViewController>();

  @override
  Widget buildViewTile(int index, IModel model, BuildContext context) {
    final themeData = Get.theme;
    final hotel = model as Place;
    return InkWell(
      onTap: () {
        Get.toNamed('/home/place-details?type=2&place_id=${hotel.id}');
      },
      borderRadius: BorderRadius.all(Radius.circular(MySize.size16)),
      child: Container(
        decoration: BoxDecoration(
          color: themeData.backgroundColor,
          border: Border.all(color: themeData.colorScheme.surface, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(MySize.size16)),
          boxShadow: [
            BoxShadow(
              color: themeData.cardTheme.shadowColor!.withAlpha(32),
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(MySize.size16),
                  topRight: Radius.circular(MySize.size16)),
              child: BlendShimmerImage(
                imageUrl: hotel.image!,
                height: MySize.getScaledSizeHeight(200),
                width: double.infinity,
                boxFit: BoxFit.fill,
              ),
            ),
            Container(
              padding: Spacing.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(hotel.name!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: themeData.textTheme.subtitle1!
                                .copyWith(fontWeight: FontWeight.w600)),
                      ),
                      Text("\$${hotel.price}",
                          style: themeData.textTheme.subtitle1!
                              .copyWith(fontWeight: FontWeight.w600))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.mapMarker,
                                    color: themeData.colorScheme.onBackground,
                                    size: MySize.size14,
                                  ),
                                  SizedBox(width: MySize.size2),
                                  Expanded(
                                    child: Text(hotel.address!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: themeData.textTheme.caption!
                                            .copyWith(
                                                fontWeight: FontWeight.w500)),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size2),
                                child: Row(
                                  children: <Widget>[
                                    Icon(MdiIcons.star,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        size: 14),
                                    Container(
                                      margin: EdgeInsets.only(left: 4),
                                      child: Text(
                                        "${hotel.guestRating ?? 0} Ratings",
                                        style: themeData.textTheme.caption!
                                            .copyWith(
                                                fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: null,
                          child: Text(
                            'Book now',
                            style: themeData.textTheme.caption!.copyWith(
                                color: themeData.disabledColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    // TODO: implement buildAppBar
    return super.buildAppBar();
  }

  @override
  IconData get tileIcon => Icons.hotel_rounded;

  @override
  String get title => 'Hotels';
}
