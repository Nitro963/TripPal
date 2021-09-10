import 'dart:developer' as developer;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'notification_service.dart';

class FCMService {
  static Future<void> initialize() async {
    await Firebase.initializeApp();

    FirebaseMessaging.onMessage.listen(_foregroundHandler);

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    developer.log('waiting FCM', name: 'FIREBASE');
    var fcmToken = await FirebaseMessaging.instance.getToken();
    developer.log('FCM-TOKEN: $fcmToken', name: 'FIREBASE');
  }

  static Future<void> _foregroundHandler(RemoteMessage message) async {
    developer.log('Handling a foreground message ${message.messageId}',
        name: 'FIREBASE');
    // Get.lazyPut(() => NotificationPageController());
    // Get.find<NotificationPageController>().onRefresh();
  }

  static Future<void> _backgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    await NotificationService.initialize();
    developer.log('Handling a background message ${message.messageId}',
        name: 'FIREBASE');
    if (message.data.isNotEmpty) {
      NotificationService.instance.showPlainNotification(
          message.hashCode, message.data['title'], message.data['body'],
          payload: message.data['payload']);
    }
  }
}
