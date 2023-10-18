import 'package:ui_renderer/models/app_config.dart';
import 'package:ui_renderer/repos/app_repo.dart';

class AppController {
  AppConfig appConfig = AppConfig(widgets: []);
  final AppRepo _appRepo = AppRepo();

  void load() {
    try {
      appConfig = _appRepo.loadAppConfig();
    } catch (e) {
      print(e);
    }
  }
}
