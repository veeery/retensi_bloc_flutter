import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:retensi_bloc/services/notifications/notification_option.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("Handling a background message: ${message.messageId}");
}

Future<void> notificationService() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // debugPrint('Got a message whilst in the foreground!');
      // debugPrint('Message data: ${message.data}');

      if (message.notification != null) {
        // debugPrint('Message also contained a notification: ${message.notification}');
        debugPrint(message.notification!.title);


      }
    });
  }


}

Future<void> subscribeTopic(String topic) async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.subscribeToTopic(topic);
}

Future<void> unsubscribeTopic(String topic) async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.unsubscribeFromTopic(topic);
}
