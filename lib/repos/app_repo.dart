import 'dart:convert';

import 'package:ui_renderer/app_data.dart';
import 'package:ui_renderer/models/app_config.dart';

class AppRepo {
  Future<AppConfig> loadAppConfig() async {
    Map<String, dynamic> response = jsonDecode(appData);
    return AppConfig.fromJson(response);
  }
}
