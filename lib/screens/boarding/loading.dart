import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trip_pal_null_safe/controllers/base_controller.dart';
import 'package:trip_pal_null_safe/services/auth_service.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';

class LoadController extends Controller {
  @override
  void onReady() {
    hasError = false;
    Get.find<AuthControl>().checkUserToken().then((_) {
      Future.delayed(Duration(seconds: 1), () {
        Get.offAllNamed('/home');
      });
    }).onError((error, stackTrace) {
      // TODO handel server response errors
      hasError = true;
      errorModel = ErrorHandlerModel.fromError(error, onReady);
    });
  }
}

// TODO add logo
class LoadingScreen extends GetView<LoadController> {
  @override
  Widget build(BuildContext context) {
    MySize.init(context);
    return Scaffold(
      body: Obx(() => !controller.hasError
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: FlutterLogo(size: MySize.size120),
                  margin: Spacing.bottom(12),
                ),
                Container(
                  margin: Spacing.left(45),
                  child: SpinKitThreeBounce(
                      color: Get.theme.colorScheme.onSurface,
                      size: MySize.size34),
                ),
              ],
            )
          : Center(child: buildErrorContent(controller.errorModel!))),
    );
  }
}
