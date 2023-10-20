import 'package:ui_renderer/app_data.dart';
import 'package:ui_renderer/models/app_config.dart';
import 'package:ui_renderer/repos/app_repo.dart';

class AppController {
  AppConfig appConfig = AppConfig(widgets: []);
  final AppRepo _appRepo = AppRepo();

  void load() {
    try {
      appConfig = _appRepo.loadAppConfig(appData);
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
}
