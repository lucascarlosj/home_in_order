import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micro_home/features/home_contractor/presenter/home_contractor_page.dart';
import 'package:micro_home/features/home_provider/presenter/home_provider_page.dart';

class MicroHomeRoutes {
  static const homeProvider = '/home-provider';
  static const homeContractor = '/home-contract';

  static MicroHomeRoutes? instance;

  static MicroHomeRoutes getIntance() {
    return instance ??= MicroHomeRoutes();
  }

  final List<RouteBase> routes = [
    GoRoute(
      path: homeProvider,
      pageBuilder: (context, state) {
        return MaterialPage(
          child: HomeProviderPage(),
        );
      },
    ),
    GoRoute(
      path: homeContractor,
      pageBuilder: (context, state) {
        return MaterialPage(
          child: HomeContractorPage(),
        );
      },
    ),
  ];
}
