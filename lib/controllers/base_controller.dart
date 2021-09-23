import 'package:get/get.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';

class Controller extends GetxController {
  final _hasError = false.obs;
  ErrorHandlerModel? errorModel;

  bool get hasError => _hasError.value;

  set hasError(bool value) {
    _hasError.value = value;
  }
}
