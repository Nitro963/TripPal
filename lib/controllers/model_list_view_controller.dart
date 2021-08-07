import 'dart:collection';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/services/api_view.dart';
import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';

import 'abstract_filters_controllers.dart';
import 'base_controller.dart';

abstract class IModelViewController<T extends IModel> extends Controller {
  ApiView<T> get api;

  final _items = List<T>.empty(growable: true).obs;

  final _isLoading = false.obs;

  ScrollController _scrollController = ScrollController();

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  final _empty = false.obs;

  // List<Filter> filteringPolices = [];
  // TODO add them in onInit
  // override this property for each screen
  // late List<FilterWidgetController> filtersControllers;
  //
  // Map<String, String> get _userFilters {
  //   Map<String, String> ret = {};
  //   filtersControllers.forEach((element) {
  //     ret.addAll(element.buildQueryParameters());
  //   });
  //   return ret;
  // }

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
    super.onInit();
  }

  void onReady() {
    onRefresh();
  }

  Future<void> onReachedEnd() async {
    _isLoading.value = true;
    try {
      var res = await api.getAllElements(
          queryParameters: {
        'skip': _items.length.toString(),
        'take': '10',
      }..addAll(Get.parameters));
      _isLoading.value = false;
      _items.addAll(res);
    } catch (e) {
      // TODO handel errors
      // errorHandler(e, onReachedEnd);
    }
  }

  Future<void> onRefresh() async {
    hasError = false;
    _empty.value = false;
    try {
      if (scrollController.hasClients) scrollController.jumpTo(0);
      var res = await api.getAllElements(
          queryParameters: {'skip': '0', 'take': '10'}..addAll(Get.parameters));
      developer.log('cleared list', name: 'MODEL_CONTROLLER');
      _items
        ..clear()
        ..addAll(res);
      if (_items.isEmpty)
        _empty.value = true;
      else
        _empty.value = false;
    } catch (e) {
      hasError = true;
      errorModel = ErrorHandlerModel.fromError(e, onRefresh);
    }
  }

  // List<SortPolicy> get sortPolices => [
//   SortPolicy('Name', 1, 'name'),
//   SortPolicy('Price', 2, 'price'),
// ];
//
// int get sortPolicy => _sortPolicy.value;
//
// set sortPolicy(int? value) {
//   if (value != null) {
//     _sortPolicy.value = value;
//     refreshIndicatorKey.currentState!.show();
//   }
// }
//
// var _sortPolicy = 0.obs;

// Map<String, dynamic> get _sortingParameters {
//   if (sortPolices.isEmpty) return {};
//   var policy = sortPolices[sortPolicy];
//   return sortPolicy != 0
//       ? {
//     'sort': policy.isAscending ? 'asc' : 'desc',
//     'sortBy': policy.attribute
//   }
//       : {};
// }
}
