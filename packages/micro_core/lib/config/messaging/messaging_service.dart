import 'dart:developer';
import 'package:micro_core/config/messaging/local_notification_config.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MessagingService {
  static final MessagingService _instance = MessagingService._();

  factory MessagingService() => _instance;

  MessagingService._();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init(BuildContext context) async {
    await _fcm
        .requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        )
        .then((settings) => debugPrint(
            'User notifications permission: ${settings.authorizationStatus}'));

    _fcm.getToken().then((token) => log('fcmToken: $token'));

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((message) {
      debugPrint('[Foreground!] - Got a message');
      debugPrint('Message data: [${message.data.toString()}]');

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        LocalNotificationConfig().androidNotification(notification, android);
      }
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        _handleNotificationClick(context, message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint(
          'onMessageOpenedApp: ${message.notification!.title.toString()}');
      _handleNotificationClick(context, message);
    });
  }

  void _handleNotificationClick(BuildContext context, RemoteMessage message) {
      context.pushNamed(message.data['screen']);
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('[Background!]: ${message.notification!.title}');
}
