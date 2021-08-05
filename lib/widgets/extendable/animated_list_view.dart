import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/animated_list_view_controller.dart';
import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

abstract class AnimatedIModelListView
    extends GetView<AnimatedListViewController> {
  Widget buildItem(IModel item, int index, double scale, BuildContext context);

  double get headerHeight;

  Widget buildHeader();

  double calcScale(int index);

  PreferredSizeWidget? buildAppBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: controller.closeHeader ? 0 : 1,
                      child: AnimatedContainer(
                          height: controller.closeHeader ? 0 : headerHeight,
                          alignment: Alignment.topCenter,
                          duration: Duration(milliseconds: 200),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            alignment: Alignment.topCenter,
                            child: buildHeader(),
                          )),
                    )),
                Expanded(
                  child: Obx(() {
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
                                          child: ListView.builder(
                                              controller:
                                                  controller.scrollController,
                                              physics: BouncingScrollPhysics(),
                                              itemCount: items.length,
                                              itemBuilder: (context, index) {
                                                return Obx(() {
                                                  var scale = calcScale(index);
                                                  return Opacity(
                                                    opacity: scale,
                                                    child: Transform(
                                                      transform:
                                                          Matrix4.identity()
                                                            ..scale(
                                                                scale, scale),
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: buildItem(
                                                          items[index],
                                                          index,
                                                          scale,
                                                          context),
                                                    ),
                                                  );
                                                });
                                              }),
                                        ),
                                        Obx(() => AnimatedOpacity(
                                              opacity:
                                                  controller.isLoading ? 1 : 0,
                                              duration:
                                                  Duration(milliseconds: 350),
                                              child: Visibility(
                                                visible: controller.isLoading,
                                                child: Container(
                                                  margin: Spacing.only(
                                                      left: 16,
                                                      right: 16,
                                                      bottom: 16),
                                                  decoration: BoxDecoration(
                                                    color: Get
                                                        .theme.cardTheme.color,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    MySize
                                                                        .size8),
                                                            bottomLeft: Radius
                                                                .circular(MySize
                                                                    .size8)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Get
                                                            .theme
                                                            .cardTheme
                                                            .shadowColor!
                                                            .withAlpha(26),
                                                        blurRadius: 5,
                                                        offset: Offset(0,
                                                            2), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      CircularProgressIndicator(),
                                                      SizedBox(
                                                          width: MySize.size30),
                                                      Text(
                                                          'Loading more items...')
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    )
                                  : Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(itemIcon,
                                              color: Get.theme.colorScheme
                                                  .onBackground,
                                              size: MySize.size100),
                                          Text('No items!'.tr,
                                              style:
                                                  Get.theme.textTheme.headline5)
                                        ],
                                      ),
                                    ),
                            ),
                    );
                  }),
                )
              ]),
        ));
  }

  IconData get itemIcon;
}
