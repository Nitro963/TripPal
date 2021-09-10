import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoadingSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(45),
        ),
        child: SpinKitCircle(
          color: Get.theme.colorScheme.secondary,
          size: 60.0,
        ),
      ),
    );
  }
}
