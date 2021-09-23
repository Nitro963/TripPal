import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trip_pal_null_safe/controllers/reviews_list_controller.dart';
import 'package:trip_pal_null_safe/dialogs/filter_dialog.dart';
import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/models/review.dart';
import 'package:trip_pal_null_safe/screens/review/review_card.dart';
import 'package:trip_pal_null_safe/services/auth_service.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';
import 'package:trip_pal_null_safe/widgets/extendable/animated_list_view.dart';
import 'package:trip_pal_null_safe/widgets/simple/custom_back_button.dart';
import 'package:trip_pal_null_safe/widgets/simple/sort_bottom_sheet.dart';

class ReviewList extends AnimatedIModelListView {
  ReviewsListController get controller => Get.find<ReviewsListController>();

  @override
  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 20.0, left: 32, right: 20.0),
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
  double get headerHeight => MySize.getScaledSizeHeight(65);

  @override
  Widget buildItem(IModel item, int index, double scale, BuildContext context) {
    return Align(
      heightFactor: 0.7,
      alignment: Alignment.topCenter,
      child: Padding(
        padding: Spacing.horizontal(15),
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

  PreferredSizeWidget? buildAppBar() {
    final themeData = Get.theme;
    return AppBar(
      title: Text('Reviews'),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: [
        CustomBackButton(defaultRoute: '/home'),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(MySize.size8),
            child: TextFormField(
              focusNode: controller.searchFocusNode,
              style: themeData.textTheme.subtitle2!
                  .copyWith(letterSpacing: 0, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                hintText: "Search".tr,
                hintStyle: themeData.textTheme.subtitle2!
                    .copyWith(letterSpacing: 0, fontWeight: FontWeight.w600),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(MySize.size16),
                    ),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(MySize.size16),
                    ),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(MySize.size16),
                    ),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: themeData.colorScheme.background,
                prefixIcon: Icon(
                  MdiIcons.magnify,
                  size: MySize.size22,
                  color: themeData.appBarTheme.iconTheme!.color!.withAlpha(150),
                ),
                isDense: true,
                contentPadding: EdgeInsets.only(right: MySize.size16),
              ),
              textCapitalization: TextCapitalization.sentences,
              onFieldSubmitted: (value) {
                controller.searchQuery = value;
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(MySize.size8),
          decoration: BoxDecoration(
            color: themeData.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(MySize.size16)),
            boxShadow: [
              BoxShadow(
                color: themeData.cardTheme.shadowColor!.withAlpha(48),
                blurRadius: 3,
                offset: Offset(0, 1),
              )
            ],
          ),
          padding: EdgeInsets.all(MySize.size12),
          child: InkWell(
            onTap: () async {
              controller.searchFocusNode.unfocus();
              Future.delayed(Duration(milliseconds: 150), () async {
                final res = await Get.bottomSheet(SortBottomSheet(
                    policies: controller.sortPolices,
                    initialValue: controller.sortPolicy));
                controller.sortPolicy = res;
              });
            },
            child: Icon(
              MdiIcons.swapVertical,
              color: themeData.appBarTheme.iconTheme!.color,
              size: 22,
            ),
          ),
        ),
        Visibility(
          visible: controller.filteringPolices.isNotEmpty,
          child: Container(
            margin: EdgeInsets.all(MySize.size8),
            decoration: BoxDecoration(
              color: themeData.backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(MySize.size16)),
              boxShadow: [
                BoxShadow(
                  color: themeData.cardTheme.shadowColor!.withAlpha(48),
                  blurRadius: 3,
                  offset: Offset(0, 1),
                )
              ],
            ),
            padding: EdgeInsets.all(MySize.size12),
            child: InkWell(
              onTap: () async {
                controller.searchFocusNode.unfocus();
                Future.delayed(Duration(milliseconds: 150), () async {
                  var res = await Get.dialog(EventFilterDialog(
                      controllers: controller.filtersControllers));
                  if (res != null && !controller.hasError)
                    controller.refreshIndicatorKey.currentState!.show();
                });
              },
              child: Icon(
                Icons.tune_outlined,
                color: themeData.appBarTheme.iconTheme!.color,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget? buildFloatingActionButton() {
    return Get.find<AuthControl>().isGuest
        ? null
        : FloatingActionButton(
            onPressed: () {
              Get.toNamed('home/places/review-writing',
                  arguments: controller.place!.id);
            },
            child: Icon(Icons.edit));
  }

  @override
  IconData get itemIcon => Icons.edit;
}
