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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: FlutterLogo(size: MySize.size120),
            margin: Spacing.bottom(12),
          ),
          Container(
            margin: Spacing.left(45),
            child: SpinKitThreeBounce(
                color: Get.theme.colorScheme.onBackground, size: MySize.size34),
          ),
        ],
      ),
    );
  }
}
