import 'dart:collection';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/scr/models/place.dart';
import 'package:travel_app/scr/screens/clima_search.dart';
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
    // Place(
    //   name: 'Munich1',
    //   state: 'Bavaria',
    //   country: 'Germany',
    // ),
    // Place(
    //   name: 'London1',
    //   country: 'United Kingdom',
    // ),
    // Place(
    //   name: 'Munich1',
    //   state: 'Bavaria',
    //   country: 'Germany',
    // ),
    // Place(
    //   name: 'London1',
    //   country: 'United Kingdom',
    // ),
    // Place(
    //   name: 'London2',
    //   country: 'United Kingdom',
    // ),
    // Place(
    //   name: 'London3',
    //   country: 'United Kingdom',
    // ),
    // Place(
    //   name: 'London4',
    //   country: 'United Kingdom',
    // ),
  ];

  ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return ChangeNotifierProvider(
      create: (_) {
        return PlacesListModel.fromList(selectedPlaces, PLACES_LIMIT);
      },
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: const Text('The Weather Buddy'),
          actions: <Widget>[
            _buildPopupMenuButton(context, textTheme),
          ],
        ),
        body: ListView(
          controller: scrollController,
          // Prevent the ListView from scrolling when an item is
          // currently being dragged.
          physics: Provider.of<PlacesListModel>(context).inReorder
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 24),
          children: <Widget>[
            // PlacesList(scrollController: scrollController),
            PlacesList(),
          ],
        ),
      ),
    );
  }

  Widget _buildPopupMenuButton(BuildContext context, TextTheme textTheme) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onSelected: (value) {
        switch (value) {
          case 'Clear all':
            Provider.of<PlacesListModel>(context, listen: false).clear();
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

class PlacesList extends StatelessWidget {
  // final ScrollController scrollController;
  //
  // const PlacesList({Key key, this.scrollController}) : super(key: key);
  Widget buildReorderable(
    BuildContext context,
    PlacesListModel model,
    Place place,
    int index,
    Widget Function(Widget tile) transitionBuilder,
  ) {
    return Reorderable(
      key: ValueKey(place),
      builder: (context, dragAnimation, inDrag) {
        final t = dragAnimation.value;
        final tile = _buildTile(context, t, place, index, model);

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

  Widget _buildTile(BuildContext context, double t, Place place, int index,
      PlacesListModel model) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final color = Color.lerp(Colors.white, Colors.grey.shade100, t);
    final elevation = lerpDouble(0, 8, t);

    final List<Widget> actions = [
      SlideAction(
        closeOnTap: true,
        color: Colors.redAccent,
        onTap: () {
          model.removePlaceAt(index);
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

  Widget _buildFooter(BuildContext context, PlacesListModel model) {
    return Box(
      color: Colors.white,
      onTap: model.places.length < model.limit
          ? () async {
              // ToDo get result from search page and add it to the state
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ClimaSearch()));
              model.addPlace(Place(name: 'Paris', country: 'France'));
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
    return Consumer<PlacesListModel>(
      builder: (context, model, _) {
        return ImplicitlyAnimatedReorderableList<Place>(
          items: model.places,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          areItemsTheSame: (oldItem, newItem) => oldItem == newItem,
          onReorderStarted: (item, index) {
            model.enterOrderPhase();
          },
          onReorderFinished: (movedPlace, from, to, newItems) {
            // scrollController.jumpTo(scrollController.offset);
            model.exitOrderPhase();
            model.replaceAll(newItems);
          },
          itemBuilder: (context, itemAnimation, place, index) {
            return buildReorderable(context, model, place, index, (tile) {
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
                context, model, place, model.places.indexOf(place), (tile) {
              return FadeTransition(
                opacity: itemAnimation,
                child: tile,
              );
            });
          },
          footer: AnimatedOpacity(
              opacity: model.isNotFull ? 1 : 0,
              duration: Duration(milliseconds: model.isNotFull ? 600 : 300),
              child: _buildFooter(context, model)),
        );
      },
    );
  }
}

class PlacesListModel extends ChangeNotifier {
  bool _inReorder = false;
  List<Place> _places = [];

  final int limit;

  PlacesListModel(this.limit);

  factory PlacesListModel.fromList(List<Place> places, int limit) {
    assert(limit >= places.length);
    var model = PlacesListModel(limit);
    model._places.addAll(places);
    return model;
  }

  bool get inReorder => _inReorder;

  UnmodifiableListView<Place> get places => UnmodifiableListView(_places);

  bool get isNotFull => _places.length < limit;

  bool get isEmpty => _places.isEmpty;

  bool get isNotEmpty => _places.isNotEmpty;

  void addPlace(Place place) {
    if (_places.length < limit && !_places.contains(place)) {
      _places.add(place);
      notifyListeners();
    }
  }

  void removePlace(Place place) {
    _places.remove(place) ?? notifyListeners();
  }

  void removePlaceAt(int index) {
    _places.removeAt(index);
    notifyListeners();
  }

  void enterOrderPhase() {
    _inReorder = true;
    notifyListeners();
  }

  void exitOrderPhase() {
    _inReorder = false;
    notifyListeners();
  }

  void replaceAll(List<Place> newPlaces) {
    _places
      ..clear()
      ..addAll(newPlaces);
    notifyListeners();
  }

  void clear() {
    _places.clear();
    notifyListeners();
  }
}
