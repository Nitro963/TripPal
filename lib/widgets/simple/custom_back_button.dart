import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utilities/utils.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key, required this.defaultRoute})
      : super(key: key);
  final String defaultRoute;
  @override
  Widget build(BuildContext context) {
    return BackButton(onPressed: () {
      if (canPop())
        Get.back();
      else {
        Get.offNamed(defaultRoute);
      }
    });
  }
}
