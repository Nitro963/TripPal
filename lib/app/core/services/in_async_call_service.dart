import 'package:get/get.dart';

import '../mixins/control/async_call_mixin.dart';

class InAsyncCallService extends GetxService with InAsyncCallMixin {
  final _inAsyncCall = false.obs;

  @override
  bool get inAsyncCall => _inAsyncCall.value;

  @override
  set inAsyncCall(bool value) {
    _inAsyncCall.value = value;
  }
}
