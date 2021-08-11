import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'dart:developer' as developer;

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/places_list_controller.dart';
import 'package:trip_pal_null_safe/models/place.dart';
import 'package:trip_pal_null_safe/models/weather_info.dart';
import 'package:trip_pal_null_safe/services/weather_service.dart';
import 'package:trip_pal_null_safe/widgets/animated/sync_button.dart';

class WeatherBuddyController extends PlacesMiniListController {
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
      // TODO handel errors
      var value =
          await Get.find<OpenWeatherMap>().weather.getWeatherByPlace(place);
      var current = _weatherStatus[index];
      current.value = value;
      current.refresh();
      _hasInfo[index].value = true;
    });
  }

  StreamSubscription<WeatherInfo>? dataSub;

  void onClose() {
    dataSub?.cancel();
    super.onClose();
  }

  GlobalKey<AnimatedSyncIconButtonState> syncButtonState =
      GlobalKey<AnimatedSyncIconButtonState>();

  Future<void> _refreshCurrentPageWeatherInfo() async {
    dataSub?.cancel();
    var page = currentPage;
    dataSub = Future.delayed(Duration(milliseconds: 500), () async {
      // TODO handel errors
      var res = await Get.find<OpenWeatherMap>()
          .weather
          .getWeatherByPlace(places[currentPage]);

      var animationController =
          syncButtonState.currentState!.animationController;

      animationController.removeStatusListener(_animationListener);

      animationController.reset();

      return res;
    }).asStream().listen((WeatherInfo res) {
      var current = _weatherStatus[page];
      current.value = res;
      current.refresh();
      _hasInfo[page].value = true;
    });
  }

  Future<void> _animationListener(status) async {
    var animationController = syncButtonState.currentState!.animationController;
    if (status == AnimationStatus.completed) {
      animationController.reset();
      await animationController.forward();
    }
  }

  Future<void> onSyncButtonPressed() async {
    developer.log('refreshing page[$currentPage] weather state',
        name: 'WEATHER_BUDDY');
    var animationController = syncButtonState.currentState!.animationController;
    if (!animationController.isAnimating) {
      animationController.addStatusListener(_animationListener);
      await animationController.forward();
    }
    await _refreshCurrentPageWeatherInfo();
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
      developer.log('Adding ${place.name}', name: 'WEATHER_BUDDY');
      _hasInfo.add(false.obs);
      _weatherStatus.add(WeatherInfo().obs);
      _requestWeatherInfo(_weatherStatus.length - 1, place);
      return true;
    }
    developer.log('${place.name} already in the list', name: 'WEATHER_BUDDY');
    return false;
  }

  Future<void> removePlaceAt(int index) async {
    developer.log('Removing ${places[index].name}', name: 'WEATHER_BUDDY');
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
    developer.log('clearing list', name: 'WEATHER_BUDDY');
    _currentPage.value = 0;
    _weatherStatus.clear();
    _hasInfo.clear();
    super.clear();
  }

  void reorder(Place place, int? from, int to, List<Place> newPlaces) {
    developer.log('reordering $from to $to', name: 'WEATHER_BUDDY');
    from = from!;
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
