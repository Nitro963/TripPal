import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

class TitledImage extends StatelessWidget {
  final String imageUrl;
  final String title;

  const TitledImage({Key? key, required this.imageUrl, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeData = Get.theme;
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
            child: FancyShimmerImage(
              imageUrl: imageUrl,
              boxFit: BoxFit.cover,
              boxDecoration: BoxDecoration(
                color: Colors.black38,
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
                  title,
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
}
