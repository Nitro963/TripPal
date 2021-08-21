import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';

// Singleton class for the ease of accessibility in FCM background handler
class NotificationService {
  final FlutterLocalNotificationsPlugin _flip =
      FlutterLocalNotificationsPlugin();

  // late final BehaviorSubject<Notification> didReceiveLocalNotificationSubject;
  late final BehaviorSubject<String?> selectNotificationSubject;
  late final NotificationAppLaunchDetails? _notificationAppLaunchDetails;
  NotificationService._internal();

  Future<bool?> _initialize() async {
    // didReceiveLocalNotificationSubject = BehaviorSubject<Notification>();
    selectNotificationSubject = BehaviorSubject<String?>();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // /// Note: permissions aren't requested here just to demonstrate that can be
    // /// done later
    // final IOSInitializationSettings initializationSettingsIOS =
    //     IOSInitializationSettings(
    //         requestAlertPermission: false,
    //         requestBadgePermission: false,
    //         requestSoundPermission: false,
    //         onDidReceiveLocalNotification: (
    //           int id,
    //           String? title,
    //           String? body,
    //           String? payload,
    //         ) async {
    //           didReceiveLocalNotificationSubject.add(
    //             ReceivedNotification(
    //               id: id,
    //               title: title,
    //               body: body,
    //               payload: payload,
    //             ),
    //           );
    //         });
    // const MacOSInitializationSettings initializationSettingsMacOS =
    //     MacOSInitializationSettings(
    //   requestAlertPermission: false,
    //   requestBadgePermission: false,
    //   requestSoundPermission: false,
    // );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      // iOS: initializationSettingsIOS,
      // macOS: initializationSettingsMacOS,
    );
    // selectNotificationSubject.stream.listen(handleSelectItemsNotification);
    var ret = await _flip.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      selectNotificationSubject.add(payload);
    });
    _notificationAppLaunchDetails =
        await _flip.getNotificationAppLaunchDetails();
    return ret;
  }

  NotificationAppLaunchDetails? get notificationAppLaunchDetails =>
      _notificationAppLaunchDetails;

  bool _handledLaunch = false;

  bool get didNotificationLaunchApp =>
      (_notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) &
      !_handledLaunch;

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

  Future<void> showPlainNotification(int id, String title, String body,
      {String? payload}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'AutoFactory', 'AutoFactory', 'AutoFactory app channel',
            importance: Importance.max, priority: Priority.high);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flip.show(id, title, body, platformChannelSpecifics,
        payload: payload);
  }

  void onClose() {
    selectNotificationSubject.close();
    // didReceiveLocalNotificationSubject.close();
  }

  // void handleSelectItemsNotification(String? payload) async {
  //   if (payload != null) {
  //     var notification = Notification.fromJson(json.decode(payload));
  //     if (notification.resource == 'items') {
  //       developer.log('Handling payload', name: 'NOTIFICATION_SERVICE');
  //       Future<Item> buildFetcher() => Get.find<BackendService>()
  //           .getApiView<Item>(name: 'items')
  //           .getItem(notification.elementId!);
  //       if (!(didNotificationLaunchApp)) {
  //         Get.put(
  //           FetchController<Item>(buildFetcher, onSuccess: (item) {
  //             Get.offAllNamed('/home/apps/items');
  //             Get.dialog(
  //               IModelDialogGridWidget(
  //                 id: item.id!,
  //                 image: item.image!,
  //                 title: item.name!,
  //                 total: item.totalCount!,
  //                 tileIcon: getTileIconFromResource('items'),
  //                 description: item.description!,
  //               ),
  //             );
  //           }),
  //         );
  //         Get.offAll(() {
  //           return FetchScreen<Item>();
  //         });
  //       } else {
  //         // Notification launched app
  //         var controller = Get.find<FetchController<void>>();
  //         void f() {
  //           controller.hasError = false;
  //           buildFetcher().then((item) {
  //             Get.offAllNamed('/home/apps/items');
  //             Get.dialog(IModelDialogGridWidget(
  //               id: item.id!,
  //               image: item.image!,
  //               title: item.name!,
  //               total: item.totalCount!,
  //               tileIcon: getTileIconFromResource('items'),
  //               description: item.description!,
  //             ));
  //             _handledLaunch = true;
  //           }).onError((error, stacktrace) {
  //             // TODO handle error codes
  //             controller.errorModel = describeError(error, () {
  //               f();
  //             });
  //             controller.hasError = true;
  //           });
  //         }
  //
  //         f();
  //       }
  //     }
  //   }
  // }
}
