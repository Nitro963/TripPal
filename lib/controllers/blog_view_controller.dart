import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/blog.dart';
import 'package:trip_pal_null_safe/services/backend_service.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';

import 'details_controller.dart';

class BlogViewController extends DetailsController {
  late final Blog blog;
  final _progress = 0.0.obs;
  final scrollController = ScrollController();

  double get progress => _progress.value;

  void onInit() {
    scrollController.addListener(() {
      if (!scrollController.position.outOfRange) {
        _progress.value = scrollController.position.pixels /
            scrollController.position.maxScrollExtent;
      }
    });
    super.onInit();
  }

  void onReady() {
    hasError = false;
    hasData = false;
    Get.find<BackendService>()
        .getApiView<Blog>(name: 'blog')
        .getItem(int.parse(Get.parameters['blog_id']!))
        .then((value) {
      blog = value;
      hasData = true;
    }).onError((e, stacktrace) {
      errorModel = ErrorHandlerModel.fromError(e, onReady);
      hasError = true;
    });
  }
}
