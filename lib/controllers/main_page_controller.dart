import 'package:get/get.dart';

class MainPageController extends GetxController {
  RxInt tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  final _inAsyncCall = false.obs;

  bool get inAsyncCall => _inAsyncCall.value;

  set inAsyncCall(bool value) {
    _inAsyncCall.value = value;
  }
}
