import 'dart:developer' as developer;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';

import 'notification_service.dart';

class FCMService {
  static Future<void> initialize() async {
    await Firebase.initializeApp();

    FirebaseMessaging.onMessage.listen(_foregroundHandler);

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);

    getToken();
  }

  static Future<void> _foregroundHandler(RemoteMessage message) async {
    developer.log('Handling a foreground message ${message.messageId}',
        name: 'FIREBASE');
    // Get.lazyPut(() => NotificationPageController());
    // Get.find<NotificationPageController>().onRefresh();
  }

  static Future<void> _backgroundHandler(RemoteMessage message) async {
    await GetStorage.init();
    await Firebase.initializeApp();
    await NotificationService.initialize();
    developer.log('Handling a background message ${message.messageId}',
        name: 'FIREBASE');
    if (message.data.isNotEmpty) {
      var token = GetStorage().read<String>('token');
      if (token != null) {
        NotificationService.instance
            .showPlainNotification(message.data['payload']!);
      }
    }
  }

  static Future<String?> getToken() async {
    developer.log('waiting FCM-TOKEN', name: 'FIREBASE');
    try {
      var fcmToken = await FirebaseMessaging.instance.getToken();
      developer.log('FCM-TOKEN: $fcmToken', name: 'FIREBASE');
      return fcmToken;
    } catch (e) {
      developer.log('FCM-TOKEN is unavailable!', name: 'FIREBASE');
    }
    return null;
  }
}
