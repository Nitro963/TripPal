import 'package:flutter/material.dart';

import 'blend_shimmer_image.dart';

enum AvatarSize {
  TAB,
  TINY,
  SMALL,
  MEDIUM,
  BIG,
}

const _Sizes = {
  AvatarSize.TAB: Size(28, 28),
  AvatarSize.TINY: Size(36, 36),
  AvatarSize.SMALL: Size(58, 58),
  AvatarSize.MEDIUM: Size(85, 85),
  AvatarSize.BIG: Size(107, 107),
};

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    this.image,
    this.initials,
    this.size = AvatarSize.MEDIUM,
    this.dimensions,
    this.shimmerDuration = const Duration(milliseconds: 1500),
    this.bgColor,
  }) : super(key: key);
  final String? image;
  final Duration shimmerDuration;
  final String? initials;
  final AvatarSize size;
  final Color? bgColor;
  final Size? dimensions;
  @override
  Widget build(BuildContext context) {
    final Size _dimensions;
    if (dimensions == null) {
      _dimensions = _Sizes[size]!;
    } else {
      _dimensions = dimensions!;
    }
    return SizedBox(
      width: _dimensions.width,
      height: _dimensions.height,
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: _dimensions.width,
              height: _dimensions.height,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
              ),
              child: image != null
                  ? BlendShimmerImage(
                      shimmerDuration: shimmerDuration,
                      shimmerHighlightColor: bgColor ?? Colors.white,
                      imageUrl: image!,
                    )
                  : null,
            ),
            if (initials != null) Text(initials!)
          ],
        ),
      ),
    );
  }
}
