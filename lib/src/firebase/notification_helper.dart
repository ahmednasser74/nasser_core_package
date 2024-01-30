// import 'dart:io';
// import 'dart:math';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:injectable/injectable.dart';

// @Injectable()
// class NotificationHelper {
//   static final NotificationHelper _instance = NotificationHelper._();

//   NotificationHelper._();

//   static NotificationHelper get instance => _instance;
//   late FirebaseMessaging messaging;
//   static Map<String, dynamic> _notificationData = {};

//   Future<void> init() async {
//     messaging = FirebaseMessaging.instance;
//     await messaging.requestPermission();
//     await FlutterLocalNotificationsPlugin().initialize(
//       const InitializationSettings(
//         android: AndroidInitializationSettings('@drawable/launch_background'),
//         iOS: DarwinInitializationSettings(requestSoundPermission: true, requestBadgePermission: true, requestAlertPermission: true),
//       ),
//       onDidReceiveBackgroundNotificationResponse: myBackgroundMessageHandler,
//       onDidReceiveNotificationResponse: (NotificationResponse details) {
//         ///lama bados 3ala el notification mn bara w app in bg mesh terminate
//         _onTapLocalNotification();
//       },
//       // onSelectNotification: _onTapLocalNotification,
//     );

//     if (Platform.isAndroid) _listenOnMessageAndFireLocalNotification();

//     await messaging.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
//     FirebaseMessaging.onBackgroundMessage(
//       (message) async {
//         await _navigateFromNotification(message);
//       },
//     );
//   }

//   static Future<void> myBackgroundMessageHandler(NotificationResponse response) async {
//     NotificationHelper._onTapLocalNotification();
//   }

//   void _listenOnMessageAndFireLocalNotification() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       _notificationData = message.data;
//       await FlutterLocalNotificationsPlugin().show(
//         Random().nextInt(100),
//         message.notification!.title,
//         message.notification!.body,
//         NotificationDetails(
//           android: const AndroidNotificationDetails(
//             'default_notification_channel',
//             'Basic Notifications',
//             importance: Importance.max,
//             priority: Priority.high,
//             ticker: 'ESU Notification',
//           ),
//           iOS: DarwinNotificationDetails(
//             presentSound: true,
//             presentBadge: true,
//             presentAlert: true,
//             badgeNumber: Random().nextInt(100),
//           ),
//         ),
//         // payload: event.data['route'],
//       );
//     });
//   }

//   Future<void> setupOnMessageOpenedApp() async {
//     final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
//     if (initialMessage != null) {
//       await _navigateFromNotification(initialMessage);
//     }
//     FirebaseMessaging.onMessageOpenedApp.listen(
//       (RemoteMessage message) {
//         _navigateFromNotification(message);
//       },
//     );
//   }

//   static void _onTapLocalNotification() {
//     if (_notificationData.isNotEmpty && _notificationData != {}) {}
//   }

//   Future<void> _navigateFromNotification(RemoteMessage message) async {
//     print('messageNotification: $message');

//     ///lama bados 3ala el notification mn bara
//     if (message.data != {}) {}
//   }

//   Future<void> removeToken() async => await messaging.deleteToken();

//   Future<String> get getFcmToken async => Platform.isIOS ? await messaging.getAPNSToken() ?? '' : await messaging.getToken() ?? '';
// }
