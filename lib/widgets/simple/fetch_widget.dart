import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/base_controller.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';
import 'package:trip_pal_null_safe/widgets/simple/splash_widget.dart';

class FetchController<T> extends Controller {
  final Future<T> Function() buildFetcher;
  final Function(T value) onSuccess;
  final Function(dynamic error, dynamic stackTrace)? onError;
  FetchController(this.buildFetcher, {required this.onSuccess, this.onError});

  void onReady() {
    hasError = false;
    buildFetcher().then(onSuccess).onError(onError ??
        (error, stackTrace) {
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
      backgroundColor: Color(0xff19062C) ,
      body: Obx(() => !controller.hasError
          ? SplashWidget()
          : Center(child: buildErrorContent(controller.errorModel!))),
    );
  }
}
