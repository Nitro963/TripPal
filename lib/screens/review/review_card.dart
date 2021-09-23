import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trip_pal_null_safe/controllers/app_theme_controller.dart';
import 'package:trip_pal_null_safe/models/review.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/themes.dart';
import 'package:trip_pal_null_safe/widgets/animated/stars.dart';
import 'package:trip_pal_null_safe/widgets/simple/blend_shimmer_image.dart';

class ReviewCard extends StatelessWidget {
  final Review review;
  final bool scrollable;
  final double height;
  final void Function()? onPressed;

  const ReviewCard(
      {Key? key,
      this.scrollable = false,
      this.height = 190,
      this.onPressed,
      required this.review})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: Shape.circular(20.0),
            color: Get.theme.cardColor,
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0)
            ]),
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Get.theme.cardColor),
              overlayColor: MaterialStateProperty.all(Colors.grey.shade200),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.transparent, style: BorderStyle.solid),
                    borderRadius: Shape.circular(20)),
              )),
          child: buildCardContent(),
        ));
  }

  Widget buildCardContent() {
    final dateFormatter = intl.DateFormat('MMM yyyy');
    final isoDateFormatter = intl.DateFormat('yyyy-MM-dd');
    final themeData = Get.theme;
    return Container(
      margin: Spacing.only(left: 8, right: 8, top: 20, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: ClipOval(
                        child: BlendShimmerImage(
                          imageUrl: review.user!.profilePicture!,
                          width: MySize.getScaledSizeHeight(80),
                          height: MySize.getScaledSizeHeight(80),
                          boxFit: BoxFit.cover,
                          errorWidget: Container(
                            color: themeData.colorScheme.surface,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(MdiIcons.alert,
                                    color: Get.theme.errorColor),
                                Text('Error',
                                    style: themeData.textTheme.caption!
                                        .copyWith(color: Get.theme.errorColor))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            review.user!.name,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontSize: 19,
                                color:
                                    Get.find<AppThemeController>().themeMode ==
                                            Themes.lightMode
                                        ? Color(0xff24253D)
                                        : Get.theme.colorScheme.onSurface),
                          ),
                          SizedBox(height: 5),
                          StarRating(
                            size: 17,
                            rating: review.overallRating!,
                            isStatic: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(dateFormatter.format(isoDateFormatter.parse(review.date!)),
                  style:
                      TextStyle(fontSize: 15, color: const Color(0xff8C8C98))),
            ],
          ),
          Space.height(15),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: scrollable
                  ? BouncingScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              child: Text(review.reviewText!,
                  maxLines: scrollable ? null : 5,
                  softWrap: true,
                  overflow:
                      scrollable ? TextOverflow.visible : TextOverflow.ellipsis,
                  style:
                      TextStyle(fontSize: 15, color: const Color(0xff8C8C98))),
            ),
          ),
        ],
      ),
    );
  }
}
