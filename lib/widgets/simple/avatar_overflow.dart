import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overflow_view/overflow_view.dart';
import 'package:trip_pal_null_safe/dialogs/review_dialog.dart';
import 'package:trip_pal_null_safe/models/hotel.dart';
import 'package:trip_pal_null_safe/models/review.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

class AvatarOverFlowView extends StatelessWidget {
  final List<Review> reviews;
  final Place place;
  final int count;
  AvatarOverFlowView(
      {Key? key,
      required this.reviews,
      required this.place,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MySize.getScaledSizeWidth(150),
      child: OverflowView(
        spacing: -5,
        children: reviews
            .take(5)
            .map(
              (e) => CircleAvatar(
                child: InkWell(
                    onTap: () {
                      // TODO show review dialog
                      Get.dialog(ReviewDialog(review: e));
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent),
                backgroundColor: Colors.black38,
                backgroundImage:
                    CachedNetworkImageProvider(e.user!.profilePicture!),
              ),
            )
            .toList(),
        builder: (context, remaining) {
          int took = min(5, reviews.length) - remaining;
          return CircleAvatar(
            backgroundColor: Colors.black45,
            child: InkWell(
              onTap: () {
                Get.toNamed('/home/places/reviews?place=${place.id}',
                    arguments: place);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Center(
                child: Text('${count - took}+',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ),
            ),
          );
        },
      ),
    );
  }
}
