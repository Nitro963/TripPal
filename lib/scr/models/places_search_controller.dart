import 'dart:collection';
import 'package:get/get.dart';
import 'package:travel_app/scr/models/place.dart';
import 'package:travel_app/scr/services/networking.dart';

class PlacesSearchController extends GetxController {
  RxBool _isLoading = false.obs;
  RxList<Place> _suggestions = history.obs;
  RxString _query = ''.obs;

  bool get isLoading => _isLoading.value;

  UnmodifiableListView<Place> get suggestions =>
      UnmodifiableListView(_suggestions);

  String get query => _query.value;

  bool get isHistory => _query.isEmpty;

  void onQueryChanged(String query) async {
    if (query == _query.value) return;

    _query.value = query;
    _isLoading.value = true;

    if (query.isEmpty) {
      _suggestions.value = history;
    } else {
      final body = await PhotonAPI.getQuery(query);
      final features = body['features'] as List;
      _suggestions.value =
          features.map((e) => Place.fromJson(e)).toSet().toList();
    }
    _isLoading.value = false;
  }

  void clear() {
    _suggestions.value = history;
  }
}

List<Place> history = [
  Place(
    name: 'San Fracisco',
    country: 'United States of America',
    state: 'California',
  ),
  Place(
    name: 'Singapore',
    country: 'Singapore',
  ),
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
