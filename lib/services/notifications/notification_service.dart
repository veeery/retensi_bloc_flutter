import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:retensi_bloc/model/notification_model.dart';
import 'package:retensi_bloc/pages/app_routes.dart';
import 'package:retensi_bloc/pages/navigator_key.dart';
import 'package:retensi_bloc/services/notifications/notification_option.dart';

class NotificationService {
  static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    debugPrint("Handling a background message: ${message.notification!.title}/${message.notification!.body}");
  }

  static const AndroidNotificationChannel androidNotificationChannel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notification',
      description: 'This channel is used for important notifications',
      importance: Importance.high,
  );

  static Future getNotificationPermission() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseMessaging messaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      late NotificationModel inbox;

      Map<String, dynamic> data = message.data;
      inbox = NotificationModel.fromJson(data);

      switch (inbox.action) {
        case "ROUTE":
          switch (inbox.payload) {
            case "INBOX":
              // When User Click Notification with Payload Inbox
              // It Will send User to Inbox Screen
              await navigatorKey.currentState?.pushNamed(AppPages.testing);
              break;
            default:
              // do nothing
              break;
          }
          break;
        case "URL":
          // Open Browser with url launcher to url target
          break;
        default:
          // do Nothing;
          break;
      }
    });

    AndroidNotificationChannel androidChannel = androidNotificationChannel;

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(androidChannel);
  }

  static Future<void> subscribeTopic(String topic) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.subscribeToTopic(topic);
  }

  static Future<void> unsubscribeTopic(String topic) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.unsubscribeFromTopic(topic);
  }

}
