import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/screens/review/review_card.dart';
import 'package:trip_pal_null_safe/screens/review/reviews_bar_chart.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';
import 'package:trip_pal_null_safe/widgets/extendable/animated_list_view.dart';
import 'package:trip_pal_null_safe/controllers/reviews_list_controller.dart';

class ReviewList extends AnimatedIModelListView {
  ReviewsListController get controller => Get.find<ReviewsListController>();

  // TODO read statistics from server (i.e extend the controller)
  @override
  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(children: [
          Text('4.5',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffffaa00),
                  fontSize: 60)),
          Text(
            'out of 5',
            style: Get.textTheme.headline6!
                .copyWith(color: const Color(0xff8c8c98)),
          ),
        ]),
        SizedBox(width: 35),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                height: MySize.getScaledSizeHeight(170),
                width: MySize.getScaledSizeWidth(280),
                child: ReviewsBarChart.withSampleData()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Total Rating 25',
                  style: Get.textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Get.theme.colorScheme.onSurface)),
            ),
          ],
        ),
      ],
    );
  }

  // TODO read from model
  @override
  Widget buildItem(IModel item, int index, double scale, BuildContext context) {
    // var review = item as Review;
    return Align(
      heightFactor: 0.7,
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Hero(
          tag: '$index card',
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: ReviewCard(
            onPressed: scale.floor() == 1
                ? () async {
                    Navigator.of(context).push(HeroDialogRoute(
                      builder: (context) => Center(
                        child: Hero(
                          tag: '$index card',
                          createRectTween: (begin, end) {
                            return CustomRectTween(begin: begin, end: end);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ReviewCard(
                                height: MySize.screenHeight * 0.65,
                                scrollable: true,
                                onPressed: null),
                          ),
                        ),
                      ),
                    ));
                  }
                : null,
          ),
        ),
      ),
    );
  }

  @override
  double calcScale(int index) {
    double scale = 1.0;
    if (controller.topContainer > 0.5) {
      scale = index + 0.9 - controller.topContainer;
      if (scale < 0) {
        scale = 0;
      } else if (scale > 1) scale = 1;
    }
    return scale;
  }

  @override
  double get headerHeight => MySize.getScaledSizeHeight(180);

  @override
  PreferredSizeWidget? buildAppBar() {
    return AppBar(
      title: Text('Review'),
      actions: [
        IconButton(
          icon: Icon(FontAwesomeIcons.edit),
          onPressed: () {
            Get.toNamed('/review-writing');
          },
        ),
        IconButton(
            icon: Icon(Icons.tune_outlined),
            onPressed: () {
              // TODO show filtering dialog
            }),
      ],
    );
  }

  @override
  IconData get itemIcon => Icons.edit;
}
