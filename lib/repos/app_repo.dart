import 'dart:convert';

import 'package:ui_renderer/models/app_config.dart';

class AppRepo {
  AppConfig loadAppConfig(String appData) {
    Map<String, dynamic> response = jsonDecode(appData);
    return AppConfig.fromJson(response);
  }
}
