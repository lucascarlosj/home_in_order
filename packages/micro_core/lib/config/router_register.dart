import 'package:micro_auth/micro_auth_routes.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_home/micro_auth_routes.dart';

final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

class RouterRegister {
  static RouterRegister? _instance;

  static RouterRegister getIntance() {
    return _instance ??= RouterRegister();
  }

  final dynamic router = GoRouter(
    navigatorKey: globalKey,
    initialLocation: '/login',
    observers: [
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)
    ],
    routes: <RouteBase>[
      ShellRoute(
        builder: (context, __, child) => child,
        routes: [
          ...MicroAuthRoutes.getIntance().routes,
          ...MicroHomeRoutes.getIntance().routes,
        ],
      )
    ],
  );
}
