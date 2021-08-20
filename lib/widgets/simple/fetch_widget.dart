import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../simple/splash_widget.dart';
import '../../utilities/size_config.dart';
import '../../controllers/base_controller.dart';
import '../../utilities/utils.dart';

class FetchController<T> extends Controller {
  final Future<T> Function() buildFetcher;
  final Function(T value) onSuccess;
  FetchController(this.buildFetcher, {required this.onSuccess});

  void onReady() {
    hasError = false;
    buildFetcher().then(onSuccess).onError((error, stackTrace) {
      errorModel = ErrorHandlerModel.fromError(error, onReady);
      hasError = true;
    });
  }
}

// TODO add logo
class FetchScreen<T> extends GetView<FetchController<T>> {
  @override
  Widget build(BuildContext context) {
    MySize.init(context);
    return Scaffold(
      body: Obx(() => !controller.hasError
          ? SplashWidget()
          : Center(child: buildErrorContent(controller.errorModel!))),
    );
  }
}
