import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/details_controller.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';

abstract class DetailsScaffold extends GetView<DetailsController> {
  PreferredSizeWidget? buildAppBar();

  Widget buildBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Obx(() {
        if (controller.hasData) return buildBody();
        return Center(
            child: !controller.hasError
                ? CircularProgressIndicator()
                : buildErrorContent(controller.errorModel!));
      }),
    );
  }
}
