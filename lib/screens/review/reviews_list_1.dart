import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/models/review.dart';
import 'package:trip_pal_null_safe/screens/review/review_card.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';
import 'package:trip_pal_null_safe/widgets/extendable/animated_list_view.dart';
import 'package:trip_pal_null_safe/controllers/reviews_list_controller.dart';

class ReviewList extends AnimatedIModelListView {
  ReviewsListController get controller => Get.find<ReviewsListController>();

  @override
  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Share your opinion!',
              overflow: TextOverflow.clip,
              style: Get.textTheme.headline4!
                  .copyWith(fontWeight: FontWeight.bold)),
          Text('See what other users think about ${controller.place!.name}',
              overflow: TextOverflow.clip, style: Get.textTheme.headline5!),
        ],
      ),
    );
  }

  @override
  double get headerHeight => MySize.getScaledSizeHeight(80);

  @override
  Widget buildItem(IModel item, int index, double scale, BuildContext context) {
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
            review: item as Review,
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
                                review: item,
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
  PreferredSizeWidget? buildAppBar() {
    return AppBar(
      title: Text('Reviews'),
      actions: [
        IconButton(
          icon: Icon(FontAwesomeIcons.edit),
          onPressed: () {
            Get.toNamed('home/places/review-writing',
                arguments: controller.place!.id);
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
