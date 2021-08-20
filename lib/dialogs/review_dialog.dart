import 'package:flutter/material.dart';
import 'package:trip_pal_null_safe/models/review.dart';
import 'package:trip_pal_null_safe/screens/review/review_card.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

class ReviewDialog extends StatelessWidget {
  final Review review;

  const ReviewDialog({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: ReviewCard(
        height: MySize.screenHeight * 0.65,
        scrollable: true,
        onPressed: null,
        review: review,
      ),
    );
  }
}
