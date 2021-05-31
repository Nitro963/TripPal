import 'dart:collection';

import 'package:get/get.dart';
import 'package:travel_app/scr/models/place.dart';

class PlacesListController extends GetxController {
  RxBool _inReorder = false.obs;

  RxList<Place> _places = List<Place>.empty(growable: true).obs;

  final int limit;

  PlacesListController(this.limit);

  factory PlacesListController.from(Iterable<Place> places, int limit) {
    var controller = PlacesListController(limit);
    controller.assign(places);
    return controller;
  }

  bool get inReorder => _inReorder.value;

  UnmodifiableListView<Place> get places => UnmodifiableListView(_places);

  bool get isNotFull => _places.length < limit;

  bool get isEmpty => _places.isEmpty;

  bool get isNotEmpty => _places.isNotEmpty;

  void assign(Iterable<Place> places) {
    var se = Set<Place>.from(places);
    assert(limit >= se.length);
    _places
      ..clear()
      ..addAll(se);
  }

  bool addPlace(Place place) {
    if (_places.length < limit && !_places.contains(place)) {
      _places.add(place);
      return true;
    }
    return false;
  }

  void removePlaceAt(int index) {
    _places.removeAt(index);
  }

  void enterOrderPhase() {
    _inReorder.value = true;
  }

  void exitOrderPhase() {
    _inReorder.value = false;
  }

  void replaceAll(List<Place> newPlaces) {
    assert(newPlaces.length <= limit);
    _places
      ..clear()
      ..addAll(newPlaces);
  }

  void reorder(Place place, int from, int to, List<Place> newPlaces) {
    replaceAll(newPlaces);
  }

  void clear() {
    _places.clear();
  }
}
