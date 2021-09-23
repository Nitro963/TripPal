import 'package:get/get.dart';

import 'base_controller.dart';

abstract class DetailsController extends Controller {
  final _hasData = false.obs;

  bool get hasData => _hasData.value;

  set hasData(bool value) {
    _hasData.value = value;
  }
}
