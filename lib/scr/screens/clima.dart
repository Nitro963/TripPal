import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:travel_app/scr/models/search_model.dart';
import 'package:travel_app/scr/models/weather_info.dart';
import 'package:travel_app/scr/services/transformers.dart';
import 'package:intl/intl.dart' as intl;
import 'package:travel_app/scr/shared/constants.dart';

class WeatherDataModel extends ChangeNotifier {
  List<Place> _placesList;
  void addPlace(Place p) {
    _placesList.add(p);
    notifyListeners();
  }

  void removePlace(Place p) {
    _placesList.remove(p);
    notifyListeners();
  }

  UnmodifiableListView<Place> get placesList =>
      UnmodifiableListView(_placesList);
}

class Clima extends StatefulWidget {
  @override
  _ClimaState createState() => _ClimaState();
}

class _ClimaState extends State<Clima> {
  final pageController = PageController();
  var currentPage = 0;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget buildBackground() {
    var path;
    var key;
    switch (currentPage) {
      case 0:
        path = 'night.jpg';
        key = ValueKey<int>(0);
        break;
      case 1:
        path = 'map.jpg';
        key = ValueKey<int>(1);
        break;
      default:
        path = 'default.jpg';
        key = ValueKey<int>(-1);
    }
    return Image.asset(
      'images/$path',
      key: key,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      colorBlendMode: BlendMode.darken,
      color: Colors.black38,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: BackButton(),
          actions: [
            IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  print("remove current weather state");
                }),
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  print('refresh weather state');
                }),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print('Search Bar');
                }),
          ],
        ),
        body: Stack(children: [
          AnimatedSwitcher(
              duration: Duration(milliseconds: 800), child: buildBackground()),
          PageView.builder(
              controller: pageController,
              itemCount: 2,
              itemBuilder: (context, index) => Container()),
          TransformerPageView(
              scrollDirection: Axis.horizontal,
              transformer: ScaleAndFadeTransformer(),
              itemCount: 2,
              onPageChanged: (int page) {
                pageController.animateToPage(page,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear);
                setState(() {
                  currentPage = page;
                });
              },
              itemBuilder: (context, index) =>
                  WeatherPage(weatherInfo: WeatherInfo())),
          Positioned(
              top: 90,
              left: 20,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 2,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.white,
                  dotWidth: 16,
                  dotHeight: 4,
                  spacing: 3,
                  expansionFactor: 2,
                ),
              )),
        ]));
  }
}

class WeatherPage extends StatelessWidget {
  final textStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Lato',
      fontWeight: FontWeight.bold,
      fontSize: 35);

  final WeatherInfo weatherInfo;

  WeatherPage({Key key, @required this.weatherInfo}) : super(key: key);

  String _formatDateTime() {
    DateTime dt = DateTime.now().toUtc();
    if (weatherInfo.timeZoneShift < 0) {
      dt.subtract(Duration(seconds: -1 * weatherInfo.timeZoneShift));
    } else {
      dt.add(Duration(seconds: weatherInfo.timeZoneShift));
    }
    var formatter = intl.DateFormat('hh:mm a - EEEE, d MMM y');
    return formatter.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(weatherInfo.cityName, style: textStyle),
                      Text(_formatDateTime(),
                          style: textStyle.copyWith(fontSize: 14))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${weatherInfo.temperature.toInt()}\u00B0C',
                        style: textStyle.copyWith(
                            fontSize: 85, fontWeight: FontWeight.w300),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "images/SVG/${weatherInfo.weatherIcon}.svg",
                            height: 45,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text('${weatherInfo.weatherMainCondition}',
                                style: textStyle.copyWith(
                                    fontSize: 25, fontWeight: FontWeight.w500)),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('Wind', style: textStyle.copyWith(fontSize: 16)),
                          Text(
                              '${(weatherInfo.windSpeed * 3.6).toStringAsPrecision(2)} km/h',
                              style: textStyle.copyWith(fontSize: 24)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Cloudiness',
                              style: textStyle.copyWith(fontSize: 16)),
                          Text('${weatherInfo.cloudiness} %',
                              style: textStyle.copyWith(fontSize: 24)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Humidity',
                              style: textStyle.copyWith(fontSize: 16)),
                          Text('${weatherInfo.humidity} %',
                              style: textStyle.copyWith(fontSize: 24)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ClimaSearch extends StatefulWidget {
  @override
  _ClimaSearchState createState() => _ClimaSearchState();
}

class _ClimaSearchState extends State<ClimaSearch> {
  var searchBarController = FloatingSearchBarController();

  Widget buildSearchBar() {
    final actions = [
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ];

    return Consumer<SearchModel>(
      builder: (context, model, _) => FloatingSearchBar(
        backgroundColor: Colors.white,
        controller: searchBarController,
        clearQueryOnClose: true,
        iconColor: Colors.grey,
        transitionDuration: const Duration(milliseconds: 800),
        transitionCurve: Curves.easeInOutCubic,
        physics: const BouncingScrollPhysics(),
        axisAlignment: 0,
        openAxisAlignment: 0.0,
        maxWidth: SizeConfig.screenWidth,
        actions: actions,
        progress: model.isLoading,
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: model.onQueryChanged,
        scrollPadding: EdgeInsets.zero,
        transition: SlideFadeFloatingSearchBarTransition(),
        accentColor: Colors.blueAccent,
        builder: (context, _) => buildExpandableBody(model),
        body: buildBody(),
      ),
    );
  }

  Widget buildExpandableBody(SearchModel model) {
    return Material(
      color: Colors.white,
      elevation: 4.0,
      borderRadius: BorderRadius.circular(8),
      child: ImplicitlyAnimatedList<Place>(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        items: model.suggestions.take(6).toList(),
        areItemsTheSame: (a, b) => a == b,
        itemBuilder: (context, animation, place, i) {
          return SizeFadeTransition(
            animation: animation,
            child: buildItem(context, place),
          );
        },
        updateItemBuilder: (context, animation, place) {
          return FadeTransition(
            opacity: animation,
            child: buildItem(context, place),
          );
        },
      ),
    );
  }

  Widget buildItem(BuildContext context, Place place) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final model = Provider.of<SearchModel>(context, listen: false);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            searchBarController.close();
            Future.delayed(
              const Duration(milliseconds: 500),
              () => model.clear(),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                SizedBox(
                  width: 36,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: model.suggestions == history
                        ? const Icon(Icons.history, key: Key('history'))
                        : const Icon(Icons.place, key: Key('place')),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: textTheme.subtitle1,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        place.level2Address,
                        style: textTheme.bodyText2
                            .copyWith(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (model.suggestions.isNotEmpty && place != model.suggestions.last)
          const Divider(height: 0),
      ],
    );
  }

  Widget buildBody() {
    return Image.asset(
      'images/map.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      colorBlendMode: BlendMode.darken,
      color: Colors.black38,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Directionality(
            textDirection: TextDirection.ltr,
            child: ChangeNotifierProvider(
                create: (_) => SearchModel(), child: buildSearchBar())));
  }

  @override
  void dispose() {
    searchBarController.dispose();
    super.dispose();
  }
}
