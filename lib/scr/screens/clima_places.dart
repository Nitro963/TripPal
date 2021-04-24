import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:travel_app/scr/models/search_model.dart';
import 'package:travel_app/scr/screens/clima_search.dart';
import 'package:travel_app/scr/screens/trip_planning.dart';
import 'package:travel_app/scr/widgets/clickable_box.dart';

class ClimaPlaces extends StatefulWidget {
  const ClimaPlaces({
    Key key,
  }) : super(key: key);

  @override
  _ClimaPlacesState createState() => _ClimaPlacesState();
}

class _ClimaPlacesState extends State<ClimaPlaces>
    with SingleTickerProviderStateMixin {
  static const List<String> OPTIONS = [
    'Clear all',
  ];
  static const int PLACES_LIMIT = 6;

  final List<Place> selectedPlaces = [
    Place(
      name: 'Munich',
      state: 'Bavaria',
      country: 'Germany',
    ),
    Place(
      name: 'London',
      country: 'United Kingdom',
    ),
  ];

  bool inReorder = false;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Weather Buddy'),
        actions: <Widget>[
          _buildPopupMenuButton(textTheme),
        ],
      ),
      body: ListView(
        controller: scrollController,
        // Prevent the ListView from scrolling when an item is
        // currently being dragged.
        physics: inReorder
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 24),
        children: <Widget>[
          _buildVerticalPlacesList(),
        ],
      ),
    );
  }

  Widget _buildVerticalPlacesList() {
    final theme = Theme.of(context);

    Widget buildReorderable(
      Place place,
      int index,
      Widget Function(Widget tile) transitionBuilder,
    ) {
      return Reorderable(
        key: ValueKey(place),
        builder: (context, dragAnimation, inDrag) {
          final t = dragAnimation.value;
          final tile = _buildTile(t, place, index);

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

    return ImplicitlyAnimatedReorderableList<Place>(
      items: selectedPlaces,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      areItemsTheSame: (oldItem, newItem) => oldItem == newItem,
      onReorderStarted: (item, index) => setState(() => inReorder = true),
      onReorderFinished: (movedPlace, from, to, newItems) {
        scrollController.jumpTo(scrollController.offset);
        setState(() {
          inReorder = false;

          selectedPlaces
            ..clear()
            ..addAll(newItems);
        });
      },
      itemBuilder: (context, itemAnimation, place, index) {
        return buildReorderable(place, index, (tile) {
          return SizeFadeTransition(
            sizeFraction: 0.7,
            curve: Curves.easeInOut,
            animation: itemAnimation,
            child: tile,
          );
        });
      },
      updateItemBuilder: (context, itemAnimation, place) {
        return buildReorderable(place, selectedPlaces.indexOf(place), (tile) {
          return FadeTransition(
            opacity: itemAnimation,
            child: tile,
          );
        });
      },
      footer: AnimatedOpacity(
          opacity: selectedPlaces.length < PLACES_LIMIT ? 1 : 0,
          duration: Duration(
              milliseconds: selectedPlaces.length < PLACES_LIMIT ? 600 : 300),
          child: _buildFooter(context, theme.textTheme)),
    );
  }

  Widget _buildTile(double t, Place place, int index) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final color = Color.lerp(Colors.white, Colors.grey.shade100, t);
    final elevation = lerpDouble(0, 8, t);

    final List<Widget> actions = [
      SlideAction(
        closeOnTap: true,
        color: Colors.redAccent,
        onTap: () {
          setState(
            () => selectedPlaces.removeAt(index),
          );
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

  Widget _buildFooter(BuildContext context, TextTheme textTheme) {
    return Box(
      color: Colors.white,
      onTap: selectedPlaces.length < PLACES_LIMIT
          ? () async {
              // final result = await Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const LanguageSearchPage(),
              //   ),
              // );
              //
              // if (result != null && !selectedPlaces.contains(result)) {
              //   setState(() {
              //     selectedPlaces.add(result);
              //   });
              // }
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ClimaSearch()));
              setState(() {
                selectedPlaces.add(Place(name: 'Paris', country: 'France'));
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
              style: textTheme.bodyText2,
            ),
          ),
          const Divider(height: 0),
        ],
      ),
    );
  }

  Widget _buildPopupMenuButton(TextTheme textTheme) {
    return PopupMenuButton<String>(
      padding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onSelected: (value) {
        switch (value) {
          case 'Clear all':
            setState(selectedPlaces.clear);
            break;
        }
      },
      itemBuilder: (context) => OPTIONS.map((option) {
        return PopupMenuItem(
          value: option,
          child: Text(
            option,
            style: textTheme.bodyText1,
          ),
        );
      }).toList(),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
