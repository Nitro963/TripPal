import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:trip_pal_null_safe/controllers/places_list_controller.dart';
import 'package:trip_pal_null_safe/models/place.dart';
import 'package:trip_pal_null_safe/widgets/simple/clickable_box.dart';

abstract class ArrangeablePlacesListView
    extends GetView<PlacesMiniListController> {
  final ScrollController scrollController;
  final bool buildFooter;

  ArrangeablePlacesListView(
      {Key? key, required this.scrollController, this.buildFooter = true})
      : super(key: key);

  Reorderable buildArrangeable(
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
    final theme = Get.theme;
    final textTheme = theme.textTheme;
    final color =
        Color.lerp(theme.scaffoldBackgroundColor, Colors.grey.shade100, t)!;
    final elevation = lerpDouble(0, 8, t)!;

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
                style: textTheme.bodyText1!.copyWith(
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
                style: textTheme.bodyText1!.copyWith(
                  color: theme.colorScheme.primary,
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

  void onAddButtonPressed();

  Widget _buildFooter(BuildContext context) {
    return Box(
      color: Get.theme.scaffoldBackgroundColor,
      onTap: controller.places.length < controller.limit
          ? onAddButtonPressed
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
              style: Get.textTheme.bodyText2,
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
            return buildArrangeable(context, place, index, (tile) {
              return SizeFadeTransition(
                sizeFraction: 0.7,
                curve: Curves.easeInOut,
                animation: itemAnimation,
                child: tile,
              );
            });
          },
          updateItemBuilder: (context, itemAnimation, place) {
            return buildArrangeable(
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
