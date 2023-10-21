import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ui_renderer/models/app_config.dart';

class AppRepo {
  Future<AppConfig> loadAppConfig(String path) async {
    String appData = await rootBundle.loadString(path);
    Map<String, dynamic> response = jsonDecode(appData);
    return AppConfig.fromJson(response);
  }
}
