import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/services/auth_service.dart';
import 'package:trip_pal_null_safe/services/notification_service.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';
import 'package:trip_pal_null_safe/widgets/simple/fetch_widget.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchController<void>(buildFetcher,
        onSuccess: onSuccess, onError: onError));
  }

  Future<void> buildFetcher() => Get.find<AuthControl>().checkUserToken();

  void onSuccess(_) {
    Future.delayed(Duration(seconds: 1), () async {
      var notificationAppLaunchDetails =
          NotificationService.instance.notificationAppLaunchDetails;
      if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
        if (notificationAppLaunchDetails!.payload != null)
          NotificationService.instance
              .handlePayload(notificationAppLaunchDetails.payload);
        else {
          Get.offAllNamed('/home');
        }
      } else {
        Get.offAllNamed('/home');
      }
    });
  }

  void onError(error, stackTrace) {
    if (error is dio.DioError) {
      var controller = Get.find<FetchController<void>>();
      if (error.type == dio.DioErrorType.response) {
        switch (error.response!.statusCode) {
          case 401:
            Get.find<AuthControl>().onUnauthorizedError();
            return;
        }
      }
      controller.errorModel =
          ErrorHandlerModel.fromError(error, controller.onReady);
      controller.hasError = true;
    }
  }
}
