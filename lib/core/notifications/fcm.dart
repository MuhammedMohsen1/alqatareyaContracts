// import 'dart:convert';
// import 'package:cat_group/core/injection/di_container.dart';
// import 'package:cat_group/core/notifications/local_notifications.dart';
// import 'package:cat_group/features/layout/bloc/layout_cubit.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// Future<void> handleBackGroundMessage(RemoteMessage? message) async {
//   if (message == null) return;
//   if (kDebugMode) {
//     print(message.data);
//   }
// }
//
// mixin Fcm {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//
//   Future<void> requestPermission() async {
//     await _firebaseMessaging.requestPermission(
//       sound: true,
//       badge: true,
//       alert: true,
//       announcement: true,
//       carPlay: false,
//       provisional: false,
//       criticalAlert: false,
//     );
//   } // this request for IOS & MacOs & Web
//
//   Future<void> fcmSettings(BuildContext context) async {
//     await _firebaseMessaging.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     ); /* for apple notifications when received in the foreground */
//     await _firebaseMessaging
//         .getInitialMessage()
//         .then(handleMessage); /* when the app open from terminated state */
//     FirebaseMessaging.onMessageOpenedApp.listen(
//       handleMessage,
//       onDone: () {
//         LayoutCubit.get(context).alertNotification();
//       },
//     ); /*  when app is in background */
//     FirebaseMessaging.onBackgroundMessage(
//         handleBackGroundMessage); /* when app is in background */
//     FirebaseMessaging.onMessage.listen((message) {
//       final notification = message.notification;
//       if (message.notification != null) {
//         sl<LocalNotifications>().showNotification(
//           id: 0,
//           title: notification!.title,
//           body: notification.body,
//           payLoad: jsonEncode(message.toMap()),
//         );
//       }
//       LayoutCubit.get(context).alertNotification();
//     }); /* when app is in foreground */
//   }
//
//   Future<void> initNotifications(BuildContext context) async {
//     await requestPermission();
//     if (context.mounted) {
//       await fcmSettings(context);
//     }
//     if (context.mounted) {
//       await sl<LocalNotifications>().init(context);
//     }
//   }
//
//   void handleMessage(RemoteMessage? message) async {
//     if (message == null) return;
//     if (kDebugMode) {
//       print(message.data);
//     }
//   } // for navigation to the required screen with required data if found
// }
