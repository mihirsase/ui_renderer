import 'package:get/get.dart';
import 'package:ui_renderer/models/app_config.dart';
import 'package:ui_renderer/repos/app_repo.dart';

class AppController extends GetxController{
  AppConfig appConfig = AppConfig(widgets: []);
  final AppRepo _appRepo = AppRepo();
  var isLoading = false.obs;

  Future load() async {
    try {
      isLoading.value = true;
      appConfig = await _appRepo.loadAppConfig("lib/assets/app_data.json");
    } catch (e, s) {
      print(e);
      print(s);
      Get.snackbar("Error", "Something went wrong!!");
    }
    isLoading.value = false;
  }
}
