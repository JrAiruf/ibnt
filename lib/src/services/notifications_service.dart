// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ibnt/src/app_imports.dart';

class NotificationsService {
  NotificationsService();

  static Future<void> _handleBackgroundNotification(RemoteMessage message) async {
    Modular.to.navigate("/bible_messages/");
  }

  static Future<void> initializeNotifications() async {
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    firebaseMessaging.setAutoInitEnabled(true);
    await firebaseMessaging.requestPermission();
    await firebaseMessaging.subscribeToTopic("bible_messages");
    
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      await _handleBackgroundNotification(initialMessage);
    }
    await firebaseMessaging.requestPermission(provisional: true);
    final fcmToken = await firebaseMessaging.getToken();
    log("$fcmToken");

    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundNotification);
  }
}
