import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:retensi_bloc/services/notifications/notification_service.dart';

class NotificationPlatformService {
  static final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static void listenNotification() async {
    // initiate Android Setting notification
    var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');

    // initiate Apple Setting notification
    var initializationSettingsIOS = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      // onDidReceiveLocalNotification:
    );

    // initialize all setting for local notification firebase
    var initializeSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS
    );

    flutterLocalNotificationsPlugin.initialize(
      initializeSettings,
      onDidReceiveBackgroundNotificationResponse: (details) {
        print(details);
      },
      onDidReceiveNotificationResponse: (details) {
        print(details);
      },
    );

    AndroidNotificationChannel androidChannel = NotificationService.androidNotificationChannel;

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? androidNotification = message.notification?.android;
      AppleNotification? iosNotification = message.notification?.apple;

      if (notification != null && (androidNotification != null || iosNotification != null)) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: androidInitialize(channel: androidChannel),
              iOS: appleInitialize(),
            ),
        );
      }
    });
  }

  static AndroidNotificationDetails androidInitialize({required AndroidNotificationChannel channel}) {
    return AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        showProgress: true,
        actions: [
          // AndroidNotificationAction(androidChannel.id, "OK"),
          // AndroidNotificationAction(androidChannel.id, "Cancel")
        ],
        icon: 'launch_background'
    );
  }

  static DarwinNotificationDetails appleInitialize() {
    return const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true
    );
  }

}
