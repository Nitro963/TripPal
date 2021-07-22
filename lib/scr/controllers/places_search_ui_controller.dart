import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/models/place.dart';

class PlacesSearchUIController extends GetxController {
  final TextEditingController editingController = TextEditingController();
  final focusNode = FocusNode();
  Timer? _debounce;

  final RxString _query = ''.obs;
  final RxBool _isLoading = false.obs;
  final _showClearAction = false.obs;
  final RxList<Place> _suggestions = List<Place>.empty(growable: true).obs;

  final historyLimit;
  final Queue<Place> _history = Queue<Place>();

  PlacesSearchUIController({this.historyLimit = 10});

  String get query => _query.value;

  bool get isLoading => _isLoading.value;

  bool get showClearAction => _showClearAction.value;

  UnmodifiableListView<Place> get suggestions =>
      UnmodifiableListView(_suggestions);

  UnmodifiableListView<Place> get history => UnmodifiableListView(_history);

  void onInit() {
    editingController.addListener(() {
      onQueryChanged(editingController.text.trim());
    });
    focusNode.addListener(() {
      _showClearAction.value = focusNode.hasFocus;
    });
    super.onInit();
  }

  void onClose() {
    _debounce?.cancel();
    _dataSubscription?.cancel();
    super.onClose();
  }

  StreamSubscription<List<Place>>? _dataSubscription;

  void onQueryChanged(String value) async {
    if (_query.value == value) return;

    if (_debounce?.isActive == false) _debounce?.cancel();

    _dataSubscription?.cancel();

    if (value.isEmpty) clear();

    _query.value = value;

    if (value.length >= 3) {
      _debounce = Timer(Duration(milliseconds: 350), () async {
        _isLoading.value = true;
        await Future.delayed(Duration(milliseconds: 800), () {});
        _suggestions
          ..clear()
          ..addAll([
            Place(
              name: 'San Francisco',
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
          ]);
        // _dataSubscription =
        //     PhotonAPI.getQuery(query).asStream().listen((List<Place> res) {
        //   _suggestions
        //     ..clear()
        //     ..addAll(res.take(10));
        _isLoading.value = false;
      });
    } else
      _isLoading.value = false;
  }

  void addRecord(Place p) {
    if (_history.length >= historyLimit) _history.removeFirst();
    _history.remove(p);
    _history.addFirst(p);
  }

  void clear() {
    if (_debounce?.isActive == false) _debounce?.cancel();
    _dataSubscription?.cancel();
    editingController.text = '';
    _suggestions.clear();
  }
}
