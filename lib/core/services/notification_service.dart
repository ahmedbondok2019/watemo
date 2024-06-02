import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import '../helpers/awesome_notifications_helper.dart';

class NotificationService {
  bool isFlutterLocalNotificationsInitialized = false;
  static late FirebaseMessaging messaging;

  /// init
  Future<NotificationService> init() async {
    print("*************** init Notification ******************");

    // initialize firebase
    messaging = FirebaseMessaging.instance;

    if (!kIsWeb) {
      await setupFlutterNotifications();
    }
    FirebaseMessaging.onMessage.listen(_fcmBackgroundHandler);
    FirebaseMessaging.onBackgroundMessage(_messagingBackgroundHandler);
    return this;
  }

  /// setup Notifications
  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }

    //show notification with sound and badge
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    //NotificationSettings settings
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
    );

    isFlutterLocalNotificationsInitialized = true;
  }

  ///handle fcm notification when app is closed/terminated
  @pragma('vm:entry-point')
  static Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
    if(message.notification != null) {
      AwesomeNotificationsHelper.showNotification(
        id: 1,
        title: message.notification?.title ?? '_',
        body: message.notification?.body ?? '_',
        payload: message.data
            .cast(), // pass payload to the notification card so you can use it (when user click on notification)
      );
    }
  }

  /// handle fcm notification when app is open
  @pragma('vm:entry-point')
  static Future<void> _messagingBackgroundHandler(RemoteMessage message) async {
    if(message.notification != null) {
      AwesomeNotificationsHelper.showNotification(
        id: 1,
        title: message.notification?.title ?? '_',
        body: message.notification?.body ?? '_',
        payload: message.data
            .cast(), // pass payload to the notification card so you can use it (when user click on notification)
      );
    }
  }
}