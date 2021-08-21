import 'dart:math';

import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/filter.dart';

abstract class FilterWidgetController {
  late final Filter filter;
  void reset();
  Map<String, String> buildQueryParameters();
}

class CategoricalFilterWidgetController extends FilterWidgetController {
  final CategoricalFilter filter;
  final _choice;

  CategoricalFilterWidgetController(this.filter, {int initialChoice = -1})
      : _choice = RxInt(initialChoice);

  int get choice => _choice.value;

  set choice(int value) {
    assert(value < filter.values.length);
    if (_choice.value == value) {
      _choice.value = -1;
      return;
    }
    _choice.value = value;
  }

  void reset() {
    _choice.value = -1;
  }

  @override
  Map<String, String> buildQueryParameters() =>
      choice == -1 ? {} : {filter.attribute: filter.values[choice]};
}

class RangeFilterWidgetController extends FilterWidgetController {
  final RangeFilter filter;
  final int initialMin;
  final int initialMax;
  late final RxInt _min;
  late final RxInt _max;

  RangeFilterWidgetController(this.filter)
      : initialMax = filter.max,
        initialMin = filter.min {
    _min = RxInt(initialMin);
    _max = RxInt(initialMax);
  }

  int get min => _min.value;
  set min(int value) {
    assert(value >= filter.min);
    _min.value = value;
  }

  int get max => _max.value;
  set max(int value) {
    assert(value <= filter.max);
    _max.value = value;
  }

  void reset() {
    _min.value = initialMin;
    _max.value = initialMax;
    _activated.value = false;
  }

  @override
  Map<String, String> buildQueryParameters() {
    return activated
        ? {
            '${filter.attribute}_min': min.toString(),
            '${filter.attribute}_max': max.toString()
          }
        : {};
  }

  final _activated = false.obs;
  void toggleActivation() {
    _activated.toggle();
  }

  bool get activated => _activated.value;
}

class DateFilterWidgetController extends FilterWidgetController {
  final DateFilter filter;
  final RxInt _choice;
  DateTime? _startDate;
  DateTime? _endDate;
  final _formattedStartDate = 'Choose a start date'.tr.obs;
  final _formattedEndDate = 'Choose an end date'.tr.obs;

  DateFilterWidgetController(this.filter, {int choice = -1})
      : _choice = RxInt(choice);

  int get choice => _choice.value;

  set choice(int value) {
    _choice.value = value;
  }

  void reset() {
    _choice.value = -1;
    startDate = null;
    endDate = null;
  }

  @override
  Map<String, String> buildQueryParameters() {
    Map<String, String> ret = {};
    if (startDate != null)
      ret.addAll(
          {'${filter.attribute}_after': filter.formatter.format(startDate!)});
    if (endDate != null)
      ret.addAll(
          {'${filter.attribute}_before': filter.formatter.format(endDate!)});
    return ret;
  }

  String get formattedStartDate => _formattedStartDate.value;

  String get formattedEndDate => _formattedEndDate.value;

  set startDate(DateTime? value) {
    if (value != null)
      _formattedStartDate.value = filter.formatter.format(value);
    else
      _formattedStartDate.value = 'Choose a start date'.tr;
    _startDate = value;
  }

  set endDate(DateTime? value) {
    if (value != null)
      _formattedEndDate.value = filter.formatter.format(value);
    else
      _formattedEndDate.value = 'Choose an end date'.tr;
    _endDate = value;
  }

  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;
}

class QuantityFilterWidgetController extends FilterWidgetController {
  final QuantityFilter filter;
  late final RxDouble _min;
  late final RxDouble _max;

  final double initialMin;
  final double initialMax;

  late final _b;
  late final _c;

  QuantityFilterWidgetController(this.filter)
      : initialMin = 0,
        initialMax = 1 {
    _min = RxDouble(0);
    _max = RxDouble(1);
    _b = pow(filter.mid - filter.start, 2) /
        (filter.start - 2 * filter.mid + filter.end);
    _c = 2 * log((filter.end - filter.mid) / (filter.mid - filter.start));
  }

  int get start => (_b * (exp(_c * _min.value) - 1)).round();
  int get end => (_b * (exp(_c * _max.value) - 1)).round();

  double get min => _min.value;

  double get max => _max.value;

  set min(double value) {
    _min.value = value;
  }

  set max(double value) {
    _max.value = value;
  }

  void reset() {
    _min.value = initialMin;
    _max.value = initialMax;
    _activated.value = false;
  }

  @override
  Map<String, String> buildQueryParameters() {
    if (activated) {
      var ret = {
        'min_${filter.attribute}': start.toString(),
      };
      ret.addAll(
          end != filter.end ? {'max_${filter.attribute}': end.toString()} : {});
      return ret;
    }
    return {};
  }

  final _activated = false.obs;
  void toggleActivation() {
    _activated.toggle();
  }

  bool get activated => _activated.value;
}
