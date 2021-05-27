import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:travel_app/scr/models/place.dart';
import 'package:travel_app/scr/models/weather_info.dart';
import 'package:travel_app/scr/screens/weather/weather_buddy_places.dart';
import 'package:intl/intl.dart' as intl;
import 'package:travel_app/scr/shared/services/transformers.dart';
import 'package:travel_app/scr/widgets/loading_spinner.dart';

class WeatherBuddyController extends PlacesListController {
  RxInt _currentPage = 0.obs;

  List<Rx<WeatherInfo>> _weatherStatus =
      List<Rx<WeatherInfo>>.empty(growable: true);

  List<RxBool> _hasInfo = List<RxBool>.empty(growable: true);

  final pageController = PageController();

  WeatherBuddyController(int limit) : super(limit);

  UnmodifiableListView<bool> get hasInfo =>
      UnmodifiableListView(_hasInfo.map((e) => e.value));

  UnmodifiableListView<WeatherInfo> get weatherStatus =>
      UnmodifiableListView(_weatherStatus.map((e) => e.value));

  int get currentPage => _currentPage.value;

  factory WeatherBuddyController.from(Iterable<Place> places, int limit) {
    var controller = WeatherBuddyController(limit);
    controller.assign(places);
    return controller;
  }

  void _requestWeatherInfo(int index, Place place) {
    Future.delayed(Duration(milliseconds: 800), () async {
      var value = await place.getWeatherInfo();
      _hasInfo[index].value = true;
      var current = _weatherStatus[index];
      current.value = value;
      current.refresh();
    });
  }

  StreamSubscription<WeatherInfo> dataSub;

  void onClose() {
    dataSub?.cancel();
    super.onClose();
  }

  Future<void> refreshCurrentPageWeatherInfo() async {
    dataSub?.cancel();
    dataSub = Future.delayed(Duration(milliseconds: 500), () async {
      return await places[currentPage].getWeatherInfo();
    }).asStream().listen((WeatherInfo res) {
      var current = _weatherStatus[currentPage];
      current.value = res;
      current.refresh();
    });
    // await Future.delayed(Duration(milliseconds: 1500), () async {});
  }

  void assign(Iterable<Place> places) {
    var noDuplicatesList = Set<Place>.from(places).toList(growable: false);
    for (Place p in noDuplicatesList) {
      _hasInfo.add(false.obs);
      _weatherStatus.add(WeatherInfo().obs);
      _requestWeatherInfo(_weatherStatus.length - 1, p);
    }
    super.assign(noDuplicatesList);
    _currentPage.value = 0;
  }

  bool addPlace(Place place) {
    if (super.addPlace(place)) {
      _hasInfo.add(false.obs);
      _weatherStatus.add(WeatherInfo().obs);
      _requestWeatherInfo(_weatherStatus.length - 1, place);
      return true;
    }
    return false;
  }

  Future<void> removePlaceAt(int index) async {
    if (currentPage == index) if (currentPage == _hasInfo.length - 1) {
      currentPage = max(_hasInfo.length - 2, 0);
      await pageController.animateToPage(currentPage,
          duration: Duration(milliseconds: 350), curve: Curves.ease);
    }
    super.removePlaceAt(index);
    _hasInfo.removeAt(index);
    _weatherStatus.removeAt(index);
  }

  void clear() {
    _currentPage.value = 0;
    _weatherStatus.clear();
    _hasInfo.clear();
    super.clear();
  }

  void reorder(Place place, int from, int to, List<Place> newPlaces) {
    dynamic objectFrom = _weatherStatus[from];
    dynamic objectTo = _weatherStatus[to];
    dynamic tmp = objectFrom.value;

    objectFrom.value = objectTo.value;
    objectTo.value = tmp;

    objectFrom.refresh();
    objectTo.refresh();

    objectFrom = _hasInfo[from];
    objectTo = _hasInfo[to];
    tmp = objectFrom.value;

    objectFrom.value = objectTo.value;
    objectTo.value = tmp;

    replaceAll(newPlaces);
  }

  set currentPage(int page) {
    assert(page < _hasInfo.length);
    assert(page >= 0);
    _currentPage.value = page;
  }
}

class WeatherBuddy extends StatefulWidget {
  @override
  _WeatherBuddyState createState() => _WeatherBuddyState();
}

class _WeatherBuddyState extends State<WeatherBuddy>
    with TickerProviderStateMixin {
  final controller = Get.find<WeatherBuddyController>();
  AnimationController animationController;
  Animation<double> animation;

  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    )..repeat();
    animation = Tween<double>(begin: 0, end: -1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));
    animationController.reset();
    super.initState();
  }

  Widget _buildBackground() {
    var path;
    var key;
    if (controller.hasInfo[controller.currentPage]) {
      String val = controller.weatherStatus[controller.currentPage].weatherIcon;
      if (val == '10n' || val == '11n') val = '09n';
      if (val == '10d' || val == '11d') val = '09d';
      key = ValueKey(val);
      path = '${key.value}.jpg';
    } else {
      key = ValueKey(-1);
      path = 'Empty List.jpg';
    }
    return Image.asset(
      'images/The Weather Buddy/$path',
      key: key,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      colorBlendMode: BlendMode.darken,
      color: Colors.black38,
    );
  }

  Widget _buildEmptyPlaceHolder() {
    return Stack(
      key: ValueKey(1),
      children: [
        Image.asset(
          'images/The Weather Buddy/Empty List.jpg',
          key: ValueKey(-1),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          colorBlendMode: BlendMode.darken,
          color: Colors.black38,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Text('Please add some places to track!',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
          ),
        ),
      ],
    );
  }

  Widget _buildPlacesStack() {
    return Stack(key: ValueKey(0), children: [
      AnimatedSwitcher(
          duration: Duration(milliseconds: 800), child: _buildBackground()),
      PageView.builder(
          controller: controller.pageController,
          itemCount: controller.places.length,
          itemBuilder: (context, index) => Container()),
      TransformerPageView(
          scrollDirection: Axis.horizontal,
          transformer: ScaleAndFadeTransformer(),
          itemCount: controller.places.length,
          onPageChanged: (int page) {
            controller.pageController.animateToPage(page,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
            controller.currentPage = page;
          },
          itemBuilder: (context, index) => WeatherPage(index: index)),
      Positioned(
          top: 90,
          left: 20,
          child: SmoothPageIndicator(
            controller: controller.pageController,
            count: controller.places.length,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.white,
              dotWidth: 16,
              dotHeight: 4,
              spacing: 3,
              expansionFactor: 2,
            ),
          )),
    ]);
  }

  Widget _buildView() {
    return Obx(() => AnimatedSwitcher(
        switchOutCurve: Curves.elasticOut,
        duration: Duration(milliseconds: 650),
        child: controller.isNotEmpty
            ? _buildPlacesStack()
            : _buildEmptyPlaceHolder()));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: BackButton(),
          actions: [
            if (controller.isNotEmpty)
              IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () async {
                    await controller
                        .removePlaceAt(controller._currentPage.value);
                  }),
            if (controller.isNotEmpty)
              RotationTransition(
                turns: animation,
                child: IconButton(
                    icon: Icon(Icons.sync),
                    onPressed: () async {
                      print('refresh weather state');
                      animationController.forward();
                      await controller.refreshCurrentPageWeatherInfo();
                      await animationController.animateTo(0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeOut);
                      animationController.reset();
                    }),
              ),
            IconButton(
                icon: Icon(Icons.playlist_add),
                onPressed: () {
                  Get.to(() => WeatherBuddyPlaces());
                }),
          ],
        ),
        body: _buildView()));
  }
}

class WeatherPage extends GetView<WeatherBuddyController> {
  final textStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Lato',
      fontWeight: FontWeight.bold,
      fontSize: 35);

  final int index;

  WeatherPage({Key key, @required this.index}) : super(key: key);

  String _formatDateTime(WeatherInfo weatherInfo) {
    DateTime dt = DateTime.now().toUtc();
    dt = dt.add(Duration(seconds: weatherInfo.timeZoneShift));
    var formatter = intl.DateFormat('hh:mm a - EEEE, d MMM y');
    return formatter.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    var weatherInfo = controller.weatherStatus[index];
    return SafeArea(
      child: Obx(() => Padding(
          padding: EdgeInsets.all(20),
          child: controller.hasInfo[index]
              ? Column(
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
                              Text(_formatDateTime(weatherInfo),
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
                                    "images/The Weather Buddy/SVG/${weatherInfo.weatherIcon}.svg",
                                    height: 45,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                        '${weatherInfo.weatherMainCondition}',
                                        style: textStyle.copyWith(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500)),
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
                                  Text('Wind',
                                      style: textStyle.copyWith(fontSize: 16)),
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
                )
              : LoadingSpinner())),
    );
  }
}
