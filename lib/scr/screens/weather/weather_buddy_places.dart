import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:travel_app/scr/controllers/places_list_controller.dart';
import 'package:travel_app/scr/controllers/places_search_ui_controller.dart';
import 'package:travel_app/scr/controllers/weather_buddy_controller.dart';

import 'package:travel_app/scr/models/place.dart';
import 'package:travel_app/scr/screens/weather/places_search.dart';
import 'package:travel_app/scr/shared/Widgets/clickable_box.dart';

class WeatherBuddyPlaces extends GetView<WeatherBuddyController> {
  static const List<String> OPTIONS = ['Clear all', 'Add current trip cities'];
  static const Map<String, IconData> ICONS = {
    'Clear all': Icons.clear,
    'Add current trip cities': Icons.list_alt
  };

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
        appBar: AppBar(
          title: const Text('The Weather Buddy'),
          actions: <Widget>[
            _buildPopupMenuButton(context, textTheme),
          ],
        ),
        body: Obx(() => ListView(
                controller: scrollController,
                // Prevent the ListView from scrolling when an item is
                // currently being dragged.
                physics: controller.inReorder
                    ? const NeverScrollableScrollPhysics()
                    : const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 24),
                children: <Widget>[
                  PlacesList(
                      scrollController: scrollController,
                      controller: controller),
                ])));
  }

  Widget _buildPopupMenuButton(BuildContext context, TextTheme textTheme) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onSelected: (value) {
        switch (value) {
          case 'Clear all':
            controller.clear();
            break;
          case 'Add current trip cities':
            // TODO
            break;
        }
      },
      itemBuilder: (context) => OPTIONS.map((option) {
        return PopupMenuItem(
          value: option,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(ICONS[option], color: Colors.black, size: 20),
              SizedBox(width: 10),
              Text(
                option,
                style: textTheme.bodyText1,
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}

class PlacesList extends StatelessWidget {
  final PlacesListController controller;
  final ScrollController scrollController;
  final bool buildFooter;

  PlacesList(
      {Key key,
      @required this.scrollController,
      @required this.controller,
      this.buildFooter = true})
      : super(key: key);

  Widget buildReorderable(
    BuildContext context,
    Place place,
    int index,
    Widget Function(Widget tile) transitionBuilder,
  ) {
    return Reorderable(
      key: ValueKey(place),
      builder: (context, dragAnimation, inDrag) {
        final t = dragAnimation.value;
        final tile = _buildTile(context, t, place, index);

        // If the item is in drag, only return the tile as the
        // SizeFadeTransition would clip the shadow.
        if (t > 0.0) {
          return tile;
        }

        return transitionBuilder(
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              tile,
              const Divider(height: 0),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTile(BuildContext context, double t, Place place, int index) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final color = Color.lerp(Colors.white, Colors.grey.shade100, t);
    final elevation = lerpDouble(0, 8, t);

    final List<Widget> actions = [
      SlideAction(
        closeOnTap: true,
        color: Colors.redAccent,
        onTap: () {
          controller.removePlaceAt(index);
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
              const SizedBox(height: 4),
              Text(
                'Delete',
                style: textTheme.bodyText1.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return Slidable(
      actionPane: const SlidableBehindActionPane(),
      actions: actions,
      secondaryActions: actions,
      child: Box(
        color: color,
        elevation: elevation,
        alignment: Alignment.center,
        child: ListTile(
          title: Text(
            place.name,
            style: textTheme.bodyText2,
          ),
          subtitle: Text(
            place.level2Address,
            style: textTheme.subtitle1,
          ),
          leading: SizedBox(
            width: 36,
            height: 36,
            child: Center(
              child: Text(
                '${index + 1}',
                style: textTheme.bodyText1.copyWith(
                  color: theme.accentColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          trailing: Handle(
            delay: Duration(milliseconds: 100),
            child: Icon(
              Icons.drag_handle,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Box(
      color: Colors.white,
      onTap: controller.places.length < controller.limit
          ? () {
              Get.put(PlacesSearchUIController(), permanent: true);
              Get.to(() => PlacesSearch()).then((value) {
                if (value != null) controller.addPlace(value);
              });
            }
          : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: SizedBox(
              height: 36,
              width: 36,
              child: Center(
                child: Icon(
                  Icons.add_location_alt,
                  color: Colors.grey,
                ),
              ),
            ),
            title: Text(
              'Add a place',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          const Divider(height: 0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => ImplicitlyAnimatedReorderableList<Place>(
          items: controller.places,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          areItemsTheSame: (oldItem, newItem) => oldItem == newItem,
          onReorderStarted: (item, index) {
            controller.enterOrderPhase();
          },
          onReorderFinished: (movedPlace, from, to, newItems) {
            scrollController.jumpTo(scrollController.offset);
            controller.reorder(movedPlace, from, to, newItems);
            controller.exitOrderPhase();
          },
          itemBuilder: (context, itemAnimation, place, index) {
            return buildReorderable(context, place, index, (tile) {
              return SizeFadeTransition(
                sizeFraction: 0.7,
                curve: Curves.easeInOut,
                animation: itemAnimation,
                child: tile,
              );
            });
          },
          updateItemBuilder: (context, itemAnimation, place) {
            return buildReorderable(
                context, place, controller.places.indexOf(place), (tile) {
              return FadeTransition(
                opacity: itemAnimation,
                child: tile,
              );
            });
          },
          footer: buildFooter
              ? AnimatedOpacity(
                  opacity: controller.isNotFull ? 1 : 0,
                  duration:
                      Duration(milliseconds: controller.isNotFull ? 600 : 300),
                  child: _buildFooter(context))
              : null,
        ));
  }
}