import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_shimmer_image/defaults.dart';
import 'package:fancy_shimmer_image/widgets/image_shimmer_widget.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

///Widget that uses chached network image and Shimmer widgets to create
///beautiful widgets that are cached and have nice Shimmer effect
class BlendShimmerImage extends StatelessWidget {
  const BlendShimmerImage({
    Key? key,
    required this.imageUrl,
    this.boxFit = BoxFit.fill,
    this.width = 300,
    this.height = 300,
    this.shimmerDirection = ShimmerDirection.ltr,
    this.shimmerDuration = const Duration(milliseconds: 1500),
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.shimmerBackColor,
    this.errorWidget,
    this.boxDecoration,
    this.color,
    this.blendMode,
  }) : super(key: key);

  final String imageUrl;
  final double width;
  final double height;
  final ShimmerDirection shimmerDirection;
  final Duration shimmerDuration;
  final BoxFit boxFit;
  final Color? shimmerBaseColor;
  final Color? shimmerHighlightColor;
  final Color? shimmerBackColor;
  final Widget? errorWidget;
  final BoxDecoration? boxDecoration;
  final Color? color;
  final BlendMode? blendMode;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return CachedNetworkImage(
        color: color,
        colorBlendMode: blendMode,
        imageUrl: imageUrl,
        fit: boxFit,
        width: width,
        height: height,
        placeholder: (context, url) => ImageShimmerWidget(
              width: width,
              height: height,
              shimmerDirection: shimmerDirection,
              shimmerDuration: shimmerDuration,
              baseColor: shimmerBaseColor ?? defaultShimmerBaseColor,
              highlightColor:
                  shimmerHighlightColor ?? defaultShimmerHighlightColor,
              backColor: shimmerBackColor ?? defaultShimmerBackColor,
              boxDecoration: boxDecoration,
            ),
        errorWidget: (context, url, error) =>
            errorWidget ??
            Container(
              color: themeData.colorScheme.surface,
              child: FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MaterialCommunityIcons.alert_circle,
                        color: themeData.errorColor),
                    Text('Error'.tr,
                        style: themeData.textTheme.caption!
                            .copyWith(color: themeData.errorColor))
                  ],
                ),
              ),
            ));
  }
}
