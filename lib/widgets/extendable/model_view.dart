import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trip_pal_null_safe/controllers/app_theme_controller.dart';
import 'package:trip_pal_null_safe/controllers/model_list_view_controller.dart';
import 'package:trip_pal_null_safe/dialogs/filter_dialog.dart';
import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/themes.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';
import 'package:trip_pal_null_safe/widgets/simple/custom_back_button.dart';
import 'package:trip_pal_null_safe/widgets/simple/sort_bottom_sheet.dart';

abstract class IModelView extends GetView<IModelViewController> {
  IconData get tileIcon;
  String get title;

  Widget buildView(UnmodifiableListView<IModel> items) {
    return ListView.separated(
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
          child: Obx(() {
            if (!controller.hasError) {
              var items = controller.items;
              return RefreshIndicator(
                key: controller.refreshIndicatorKey,
                backgroundColor: Get.theme.cardColor,
                onRefresh: controller.onRefresh,
                child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 350),
                    child: items.isEmpty && !controller.emptyList
                        ? Center(
                            key: ValueKey(1),
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            key: ValueKey(2),
                            children: [
                              if (controller.emptyList)
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(tileIcon,
                                                color: Get.theme.colorScheme
                                                    .onBackground,
                                                size: MySize.size100),
                                            Text('No items!'.tr,
                                                style: Get
                                                    .theme.textTheme.headline5)
                                          ],
                                        ),
                                      ),
                                      ListView(
                                          children: [],
                                          physics:
                                              AlwaysScrollableScrollPhysics(
                                                  parent:
                                                      BouncingScrollPhysics()))
                                    ],
                                  ),
                                ),
                              if (!controller.emptyList)
                                Expanded(
                                  child: buildView(items),
                                ),
                              if (!controller.emptyList)
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
                                              bottomRight:
                                                  Radius.circular(MySize.size8),
                                              bottomLeft: Radius.circular(
                                                  MySize.size8)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Get
                                                  .theme.cardTheme.shadowColor!
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
                          )),
              );
            }
            return Center(child: buildErrorContent(controller.errorModel!));
          }),
        ),
      ],
    );
  }

  PreferredSizeWidget? buildAppBar() {
    final themeData = Get.theme;
    return AppBar(
      title: Text(title),
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
                  color: themeData.colorScheme.onBackground.withAlpha(150),
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
                MdiIcons.tune,
                color: themeData.appBarTheme.iconTheme!.color,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final customAppTheme =
        Themes.getCustomAppTheme(Get.find<AppThemeController>().themeMode);

    return Scaffold(
        appBar: buildAppBar(),
        body: buildScaffoldBody(),
        floatingActionButton: buildFloatingActionButton(),
        backgroundColor: customAppTheme.bgLayer2);
  }

  Widget? buildFloatingActionButton() {
    return null;
  }
}

abstract class IModelGridView extends IModelView {
  double findAspectRatio(double width) {
    return (width / 2 - MySize.size24) / ((width / 2 - MySize.size24) + 60);
  }

  Widget buildView(UnmodifiableListView<IModel> items) {
    return GridView.builder(
        controller: controller.scrollController,
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        padding: EdgeInsets.all(MySize.size16),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: MySize.size16,
            crossAxisSpacing: MySize.size16,
            childAspectRatio: findAspectRatio(Get.mediaQuery.size.width)),
        itemBuilder: (context, index) =>
            buildViewTile(index, items[index], context));
  }
}
