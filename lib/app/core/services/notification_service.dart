import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../data/models/notification_model.dart';

// Singleton class for the ease of accessibility in FCM background handler
class NotificationService {
  final FlutterLocalNotificationsPlugin _flip =
      FlutterLocalNotificationsPlugin();

  late final NotificationAppLaunchDetails? _notificationAppLaunchDetails;

  NotificationService._internal();

  Future<bool?> _initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true);

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    var ret = await _flip.initialize(initializationSettings,
        onSelectNotification: handlePayload);
    _notificationAppLaunchDetails =
        await _flip.getNotificationAppLaunchDetails();
    return ret;
  }

  NotificationAppLaunchDetails? get notificationAppLaunchDetails =>
      _notificationAppLaunchDetails;

  bool get didNotificationLaunchApp =>
      (_notificationAppLaunchDetails?.didNotificationLaunchApp ?? false);

  static Future<void> initialize() async {
    if (_instance != null) return;
    var service = NotificationService._internal();
    await service._initialize();
    _instance = service;
  }

  static NotificationService? _instance;

  static NotificationService get instance {
    return _instance!;
  }

  Future<void> showPlainNotification(String payload) async {
    // const AndroidNotificationDetails androidPlatformChannelSpecifics =
    //     AndroidNotificationDetails('AutoFactory', 'AutoFactory',
    //         importance: Importance.max, priority: Priority.high);
    // const IOSNotificationDetails iosNotificationDetails =
    //     IOSNotificationDetails(
    //   presentSound: true,
    //   subtitle: 'AutoFactory',
    // );
    // const NotificationDetails platformChannelSpecifics = NotificationDetails(
    //     android: androidPlatformChannelSpecifics, iOS: iosNotificationDetails);
    // var notification = Notification.fromPayload(payload);
    // await _flip.show(
    //     notification.id!,
    //     translateOffline(
    //         '${recase.ReCase(notification.resource!).titleCase}AppTitle'),
    //     translateOffline(notification.description, {
    //       (notification.secondaryResource ?? '' + '_id').tr:
    //           notification.secondaryElementId.toString()
    //     }),
    //     platformChannelSpecifics,
    //     payload: payload);
  }

  Future<void> handlePayload(String? payload) async {
    developer.log('Handling payload', name: 'NOTIFICATION_SERVICE');
    if (payload != null) {
      var notification = NotificationModel.fromPayload(payload);
      handleSelectNotification(notification);
    }
  }

  Future<void> handleSelectNotification(NotificationModel notification) async {}
}
