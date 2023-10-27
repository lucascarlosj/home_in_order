import 'dart:async';

import 'package:home_in_order/firebase_options.dart';
import 'package:micro_auth/micro_auth.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

void main() {
  start();
}

Future<void> start() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      LocalNotificationConfig().initializeNotifications();
      RemoteConfigInit.initialize();
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
      FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
      await FirebaseMessaging.instance.setAutoInitEnabled(true);
      runApp(
        Injector(
          child: App(),
        ),
      );
    },
    (error, stack) => FirebaseCrashlytics.instance.recordError(
      error,
      stack,
      fatal: true,
    ),
  );
}

final _router = RouterRegister.getIntance().router;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    AuthState().checkAuthState();
  }

  @override
  Widget build(BuildContext context) {
    final injector = Injector.instance;
    microAuthInjection(injector);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      debugShowMaterialGrid: false,
    );
  }
}
