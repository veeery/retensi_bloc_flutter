import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:retensi_bloc/services/notifications/notification_service.dart';

class NotificationPlatformService {
  static final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static void listenNotification() async {
    var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializeSettings = InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializeSettings);

    AndroidNotificationChannel androidChannel = NotificationService.androidNotificationChannel;

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? androidNotification = message.notification?.android;

      if (notification != null && androidNotification != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(androidChannel.id, androidChannel.name,
                  channelDescription: androidChannel.description,
                  showProgress: true,
                  actions: [
                    // AndroidNotificationAction(androidChannel.id, "OK"),
                    // AndroidNotificationAction(androidChannel.id, "Cancel")
                  ],
                  icon: 'launch_background'),

            ),
        );
      }
    });
  }
}
