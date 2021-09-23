import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../utilities/size_config.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Image.asset(
                'assets/images/trip_pal_logo.png',
                width: MySize.getScaledSizeWidth(250),
                height: MySize.getScaledSizeHeight(250),
              ),
            ),
          ),
          Container(
            margin: Spacing.only(top: 400),
            child: SpinKitThreeBounce(
                color: Get.theme.colorScheme.onBackground, size: MySize.size34),
          ),
        ],
      ),
    );
  }
}
