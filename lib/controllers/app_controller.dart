import 'package:get/get.dart';
import 'package:ui_renderer/models/app_config.dart';
import 'package:ui_renderer/repos/app_repo.dart';

class AppController extends GetxController {
  AppConfig appConfig = AppConfig(widgets: []);
  var isLoading = false.obs;
  final AppRepo _appRepo = AppRepo();

  Future load() async {
    try {
      isLoading.value = true;
      appConfig = await _appRepo.loadAppConfig();
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }


}
