import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:trip_pal_null_safe/controllers/places_search_view_controller.dart';
import 'package:trip_pal_null_safe/models/place.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/simple/clickable_box.dart';
import 'package:trip_pal_null_safe/widgets/simple/highlight_text.dart';

class PlacesSearch extends GetView<PlacesSearchViewController> {
  final searchBarController = FloatingSearchBarController();

  @override
  Widget build(BuildContext context) {
    var suggestions = controller.suggestions;
    var history = controller.history;
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: _buildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() => AnimatedSwitcher(
              duration: Duration(milliseconds: 350),
              child: controller.isLoading
                  ? LinearProgressIndicator(
                      value: null,
                      backgroundColor: Get.theme.backgroundColor,
                      minHeight: 5)
                  : Container(
                      constraints: BoxConstraints(
                          minHeight: 5, minWidth: double.infinity)))),
          Expanded(
            child: Obx(() => AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                child: suggestions.isNotEmpty
                    ? _buildList(suggestions, ValueKey(1))
                    : controller.query.isNotEmpty
                        ? _buildPlaceholder(ValueKey(2), 'No location found!',
                            Icons.location_city)
                        : history.isEmpty
                            ? _buildPlaceholder(ValueKey(3), 'Clean history',
                                Icons.history_toggle_off)
                            : _buildList(history, ValueKey(4)))),
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       FocusScope.of(context).unfocus();
          //     },
          //     child: Text('adsfadf'))
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    var theme = Get.theme;
    var padding = Get.mediaQuery.padding.top;
    return PreferredSize(
      preferredSize: Size.fromHeight(56 + padding),
      child: Box(
        height: 56 + padding,
        width: double.infinity,
        color: theme.appBarTheme.color!,
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.2),
        child: Column(
          children: <Widget>[
            SizedBox(height: padding),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  BackButton(
                    color: Colors.white,
                    onPressed: () {
                      controller.clear();
                      Get.back();
                    },
                  ),
                  Expanded(
                      child: TextField(
                    autofocus: true,
                    focusNode: controller.focusNode,
                    controller: controller.editingController,
                    textInputAction: TextInputAction.search,
                    style: theme.primaryTextTheme.headline6,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      hintText: 'Search...',
                      hintStyle: theme.primaryTextTheme.headline6,
                    ),
                  )),
                  Obx(
                    () => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      child: controller.showClearAction
                          ? IconButton(
                              key: ValueKey(1),
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                if (controller.query.isNotEmpty) {
                                  controller.clear();
                                } else
                                  controller.focusNode.unfocus();
                              },
                            )
                          : IconButton(
                              key: ValueKey(2),
                              icon:
                                  const Icon(Icons.search, color: Colors.white),
                              onPressed: () {
                                controller.focusNode.requestFocus();
                              },
                            ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(Place place) {
    final textTheme = Get.textTheme;
    return Box(
      border: Border(
        bottom: BorderSide(
          color: Get.theme.dividerColor,
        ),
      ),
      color: Get.theme.cardColor,
      onTap: () {
        controller.addRecord(place);
        controller.clear();
        Get.back(result: place);
      },
      child: ListTile(
        title: HighlightText(
          query: controller.query,
          text: place.name,
          style: textTheme.bodyText2!,
          activeStyle: textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textDirection: TextDirection.ltr,
        ),
        subtitle: HighlightText(
          textDirection: TextDirection.ltr,
          query: controller.query,
          text: place.level2Address,
          style: textTheme.subtitle1!,
          activeStyle:
              textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w900),
        ),
      ),
    );
  }

  Widget _buildList(List<Place> items, Key key) {
    return ImplicitlyAnimatedList<Place>(
      key: key,
      items: items,
      updateDuration: const Duration(milliseconds: 400),
      areItemsTheSame: (a, b) => a == b,
      itemBuilder: (context, animation, place, _) {
        return SizeFadeTransition(
          sizeFraction: 0.7,
          curve: Curves.easeInOut,
          animation: animation,
          child: _buildItem(place),
        );
      },
      updateItemBuilder: (context, animation, place) {
        return FadeTransition(
          opacity: animation,
          child: _buildItem(place),
        );
      },
    );
  }

  Widget _buildPlaceholder(Key key, String message, IconData icon) {
    return Center(
      key: key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            size: MySize.size48,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(
              color: Get.theme.colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
