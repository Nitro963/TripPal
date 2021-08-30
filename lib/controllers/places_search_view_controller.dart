import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/place.dart';
import 'package:trip_pal_null_safe/services/geocoding_service.dart';

class PlacesSearchViewController extends GetxController {
  final TextEditingController editingController = TextEditingController();
  final focusNode = FocusNode();
  Timer? _debounce;

  final RxString _query = ''.obs;
  final RxBool _isLoading = false.obs;
  final _showClearAction = false.obs;
  final RxList<Place> _suggestions = List<Place>.empty(growable: true).obs;

  final historyLimit;
  final Queue<Place> _history = Queue<Place>();

  PlacesSearchViewController({this.historyLimit = 10});

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
        _dataSubscription = Get.find<GeoCodingService>()
            .photon
            .getQuery(query, 10)
            .asStream()
            .listen((List<Place> res) {
          _suggestions
            ..clear()
            ..addAll(res);
          _isLoading.value = false;
        });
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
