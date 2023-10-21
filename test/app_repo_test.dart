import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_renderer/models/app_config.dart';
import 'package:ui_renderer/repos/app_repo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  test("App Repo Success Test", () async {
    AppRepo appRepo0 = AppRepo();
    AppConfig appConfig = await appRepo0.loadAppConfig("lib/assets/app_data.json");
    expect(appConfig.appTheme, isNotNull);
    expect(appConfig.widgets, isNotEmpty);
    expect(appConfig.widgets.first.widgetType, isNotNull);
  });

  test("App Repo Failure Test", () async {
    AppRepo appRepo = AppRepo();
    expect(
      () async {
        await appRepo.loadAppConfig("lib/assets/app_data_test.json");
      },
      throwsA(isInstanceOf<FormatException>()),
    );
  });
}
