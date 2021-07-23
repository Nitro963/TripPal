import 'package:intl/intl.dart' as intl;

abstract class Filter {
  final String attribute;

  Filter(this.attribute);
}

class RangeFilter extends Filter {
  final int min;
  final int max;
  RangeFilter(String attribute, this.min, this.max) : super(attribute);
}

class CategoricalFilter extends Filter {
  final List<String> values;

  CategoricalFilter(String attribute, this.values) : super(attribute);
}

class QuantityFilter extends Filter {
  final int start;
  final int mid;
  final int end;

  QuantityFilter(String attribute, this.start, this.mid, this.end)
      : super(attribute);
}

class DateFilter extends Filter {
  final intl.DateFormat formatter;
  DateFilter(String attribute, this.formatter) : super(attribute);
}
