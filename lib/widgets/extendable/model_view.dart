import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trip_pal_null_safe/controllers/model_list_view_controller.dart';
import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

// TODO handle errors
abstract class IModelView extends GetView<IModelViewController> {
  IconData get tileIcon;
  String get title;

  Widget buildView(UnmodifiableListView<IModel> items) {
    return ListView.separated(
        key: ValueKey(2),
        controller: controller.scrollController,
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        padding: EdgeInsets.all(MySize.size16),
        itemCount: items.length,
        separatorBuilder: (ctx, index) => SizedBox(height: MySize.size16),
        itemBuilder: (context, index) {
          return buildViewTile(index, items[index], context);
        });
  }

  Widget buildViewTile(int index, IModel model, BuildContext context);

  Widget buildScaffoldBody() {
    return Column(
      children: [
        Expanded(
          child: Obx(
            () {
              var items = controller.items;
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 350),
                child: items.isEmpty && !controller.emptyList
                    ? Center(
                        key: ValueKey(1),
                        child: CircularProgressIndicator(),
                      )
                    : RefreshIndicator(
                        key: controller.refreshIndicatorKey,
                        backgroundColor: Get.theme.cardColor,
                        onRefresh: controller.onRefresh,
                        child: !controller.emptyList
                            ? Column(
                                children: [
                                  Expanded(
                                    child: buildView(items),
                                  ),
                                  Obx(
                                    () => AnimatedOpacity(
                                      opacity: controller.isLoading ? 1 : 0,
                                      duration: Duration(milliseconds: 350),
                                      child: Visibility(
                                        visible: controller.isLoading,
                                        child: Container(
                                          margin: Spacing.only(
                                              left: 16, right: 16, bottom: 16),
                                          decoration: BoxDecoration(
                                            color: Get.theme.cardTheme.color,
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(
                                                    MySize.size8),
                                                bottomLeft: Radius.circular(
                                                    MySize.size8)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Get.theme.cardTheme
                                                    .shadowColor!
                                                    .withAlpha(26),
                                                blurRadius: 5,
                                                offset: Offset(0,
                                                    2), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          padding: const EdgeInsets.all(15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CircularProgressIndicator(),
                                              SizedBox(width: MySize.size30),
                                              Text('Loading more items...'.tr)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(tileIcon,
                                        color:
                                            Get.theme.colorScheme.onBackground,
                                        size: MySize.size100),
                                    Text('No items!'.tr,
                                        style: Get.theme.textTheme.headline5)
                                  ],
                                ),
                              ),
                      ),
              );
            },
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget? buildAppBar() {
    final themeData = Get.theme;
    return AppBar(
      title: Text(title),
      centerTitle: true,
      // backgroundColor: customAppTheme.bgLayer1,
      actions: [
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
              Future.delayed(Duration(milliseconds: 150), () async {
                // final res = await Get.bottomSheet(SortBottomSheet(
                //     policies: controller.sortPolices,
                //     initialValue: controller.sortPolicy));
                // controller.sortPolicy = res;
              });
            },
            child: Icon(
              MdiIcons.swapVertical,
              color: themeData.colorScheme.primary,
              size: 22,
            ),
          ),
        ),
        // Visibility(
        //   visible: controller.filteringPolices.isNotEmpty,
        //   child: Container(
        //     margin: EdgeInsets.all(MySize.size8!),
        //     decoration: BoxDecoration(
        //       color: themeData.backgroundColor,
        //       borderRadius: BorderRadius.all(Radius.circular(MySize.size16!)),
        //       boxShadow: [
        //         BoxShadow(
        //           color: themeData.cardTheme.shadowColor!.withAlpha(48),
        //           blurRadius: 3,
        //           offset: Offset(0, 1),
        //         )
        //       ],
        //     ),
        //     padding: EdgeInsets.all(MySize.size12!),
        //     child: InkWell(
        //       onTap: () async {
        //         controller.searchFocusNode.unfocus();
        //         Future.delayed(Duration(milliseconds: 150), () async {
        //           var res = await Get.dialog(EventFilterDialog(
        //               controllers: controller.filtersControllers));
        //           if (res != null)
        //             controller.refreshIndicatorKey.currentState!.show();
        //         });
        //       },
        //       child: Icon(
        //         MdiIcons.tune,
        //         color: themeData.colorScheme.primary,
        //         size: 22,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: buildScaffoldBody());
  }
}
