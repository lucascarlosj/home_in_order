

import 'package:micro_dependencies/micro_dependencies.dart';

class RemoteConfigInit{
  static final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  static Future<void> initialize() async {
    await remoteConfig.fetchAndActivate();
  }

  static RemoteConfigValue getString(String key) {
    return remoteConfig.getValue(key);
  }
}
