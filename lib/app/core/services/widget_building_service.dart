import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../utils/builders.dart';
import '../values/durations.dart';

class GetWidgetBuilder extends GetxService with AppBarBuilder {
  GetSnackBar buildErrorSnackBar(String error,
      {SnackPosition position = SnackPosition.BOTTOM,
      DismissDirection snackDismissDirection = DismissDirection.horizontal,
      margin = const EdgeInsets.only(bottom: 20),
      duration = Durations.SNACK_BAR_ANIMATION}) {
    return GetSnackBar(
      snackPosition: position,
      duration: duration,
      messageText: Text(
        error,
        style: const TextStyle(color: Colors.red),
      ),
      icon: const Icon(Icons.error, color: Colors.red),
      maxWidth: Get.width * 0.95,
      margin: margin,
      borderRadius: 10,
      dismissDirection: snackDismissDirection,
      leftBarIndicatorColor: Colors.red,
    );
  }
}
