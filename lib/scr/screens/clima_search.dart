import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:travel_app/scr/models/place.dart';
import 'package:travel_app/scr/widgets/clickable_box.dart';
import 'package:travel_app/scr/widgets/highlight_text.dart';

class ClimaSearch extends StatefulWidget {
  @override
  _ClimaSearchState createState() => _ClimaSearchState();
}

class _ClimaSearchState extends State<ClimaSearch> {
  final List<Place> filteredPlaces = [];
  final List<Place> history = [];

  bool inAsyncCall = false;

  var controller = FloatingSearchBarController();

  void onQueryChanged(String s) async {
    // if (s.length > 3) {
    //   // filteredLanguages
    //   //   ..clear()
    //   //   ..addAll(places);
    //
    //   setState(() {
    //     inAsyncCall = true;
    //   });
    //
    //   await Future.delayed(Duration(seconds: 10), () async {
    //     print("processing");
    //   });
    //
    //   setState(() {
    //     inAsyncCall = false;
    //   });
    // }
    setState(() {});
  }

  Widget _buildItem(Place place) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Box(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
      color: Colors.white,
      onTap: () => Navigator.pop(context, place),
      child: ListTile(
        title: HighlightText(
          query: controller.query,
          text: place.name,
          style: textTheme.bodyText2,
          activeStyle: textTheme.bodyText2.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: HighlightText(
          query: controller.query,
          text: place.level2Address,
          style: textTheme.subtitle1,
          activeStyle:
              textTheme.subtitle1.copyWith(fontWeight: FontWeight.w900),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: FloatingSearchAppBar(
          controller: controller,
          progress: inAsyncCall,
          color: theme.primaryColor,
          iconColor: Colors.white,
          accentColor: theme.accentColor,
          hintStyle: theme.primaryTextTheme.headline6,
          titleStyle: theme.primaryTextTheme.headline6,
          onQueryChanged: onQueryChanged,
          debounceDelay: Duration(milliseconds: 350),
          body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              child: filteredPlaces.isNotEmpty // search model answer
                  ? _buildList(filteredPlaces, ValueKey<int>(1))
                  : controller.query?.isNotEmpty == true
                      ? _buildNoLocationPlaceholder()
                      : history.isEmpty
                          ? _buildNoLocationHistoryPlaceholder()
                          : _buildList(history,
                              ValueKey<int>(2)) // show history if no query,
              )),
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

  Widget _buildNoLocationPlaceholder() {
    return Center(
      key: ValueKey<int>(3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Icon(
            Icons.location_city,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'No location found!',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoLocationHistoryPlaceholder() {
    return Center(
      key: ValueKey<int>(4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Icon(
            Icons.history_toggle_off,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'Clean history',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
