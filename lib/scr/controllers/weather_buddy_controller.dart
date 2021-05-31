import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/places_list_controller.dart';
import 'package:travel_app/scr/models/place.dart';
import 'package:travel_app/scr/models/weather_info.dart';

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
