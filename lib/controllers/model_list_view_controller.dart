import 'dart:collection';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/filter.dart';
import 'package:trip_pal_null_safe/models/sort_policy.dart';
import 'package:trip_pal_null_safe/services/api_view.dart';
import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/utilities/error_handlers.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';

import 'abstract_filters_controllers.dart';
import 'base_controller.dart';

abstract class IModelViewController<T extends IModel> extends Controller {
  ApiView<T> get api;

  final _items = List<T>.empty(growable: true).obs;
  int? _currentCount;
  final _isLoading = false.obs;

  ScrollController _scrollController = ScrollController();

  GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  final _empty = false.obs;

  late final Map<String, String?> _navigationFilters;

  List<Filter> get filteringPolices => [];

  List<FilterWidgetController> filtersControllers = [];

  Map<String, String> get _userFilters {
    Map<String, String> ret = {};
    filtersControllers.forEach((element) {
      ret.addAll(element.buildQueryParameters());
    });
    return ret;
  }

  UnmodifiableListView<T> get items => UnmodifiableListView(_items);

  bool get isLoading => _isLoading.value;

  bool get emptyList => _empty.value;

  ScrollController get scrollController => _scrollController;

  bool get atListEnd {
    if (_scrollController.position.atEdge) {
      return _scrollController.position.pixels != 0;
    }
    return false;
  }

  bool get atListStart {
    if (_scrollController.position.atEdge) {
      return _scrollController.position.pixels == 0;
    }
    return false;
  }

  void onInit() {
    _scrollController.addListener(() {
      if (_scrollController.position
          .atEdge) if (_scrollController.position.pixels != 0) onReachedEnd();
    });
    _navigationFilters = Get.parameters;
    filtersControllers = filteringPolices.map((filter) {
      if (filter is RangeFilter) return RangeFilterWidgetController(filter);
      if (filter is QuantityFilter)
        return QuantityFilterWidgetController(filter);
      if (filter is CategoricalFilter)
        return CategoricalFilterWidgetController(filter);
      return DateFilterWidgetController(filter as DateFilter);
    }).toList();
    super.onInit();
  }

  void onReady() {
    onRefresh();
  }

  Future<void> onReachedEnd() async {
    if (_currentCount == _items.length) return;
    _isLoading.value = true;
    try {
      var res = await api.getAllElements(
          queryParameters: {
        'offset': _items.length.toString(),
        'limit': '10',
      }..addAll(Get.parameters));
      _isLoading.value = false;
      _items.addAll(res.results);
    } catch (e) {
      handelError(e, onReachedEnd);
    }
  }

  Future<void> onRefresh() async {
    hasError = false;
    try {
      if (scrollController.hasClients) scrollController.jumpTo(0);
      var res = await api.getAllElements(
          queryParameters: {'offset': '0', 'limit': '10'}
            ..addIf(_searchQuery.isNotEmpty, 'q', _searchQuery)
            ..addAll(_navigationFilters)
            ..addAll(_sortingParameters)
            ..addAll(_userFilters));

      developer.log('cleared list', name: 'MODEL_CONTROLLER');
      _currentCount = res.count;
      _items
        ..clear()
        ..addAll(res.results);
      if (_items.isEmpty)
        _empty.value = true;
      else
        _empty.value = false;
    } catch (e) {
      hasError = true;
      errorModel = ErrorHandlerModel.fromError(e, onRefresh);
    }
  }

  List<SortPolicy> get sortPolices => [
        SortPolicy('None', null, 0, 'null'),
        SortPolicy('Name', 'A to Z', 1, 'name'),
        SortPolicy('Name', 'Z to A', 2, '-name'),
      ];

  int get sortPolicy => _sortPolicy.value;

  set sortPolicy(int? value) {
    if (value != null) {
      _sortPolicy.value = value;
      refreshIndicatorKey.currentState!.show();
    }
  }

  var _sortPolicy = 0.obs;

  Map<String, String> get _sortingParameters {
    if (sortPolices.isEmpty) return {};
    var policy = sortPolices[sortPolicy];
    return sortPolicy != 0 ? {'ordering': policy.attribute} : {};
  }

  var searchFocusNode = FocusNode();

  String _searchQuery = '';

  set searchQuery(String value) {
    _searchQuery = value;
    refreshIndicatorKey.currentState!.show();
  }
}
