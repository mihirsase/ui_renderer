import 'package:flutter_test/flutter_test.dart';
import 'package:ui_renderer/app_data.dart';
import 'package:ui_renderer/models/app_config.dart';
import 'package:ui_renderer/repos/app_repo.dart';

void main() {
  test("App Repo Success Test", () async {
    AppRepo appRepo0 = AppRepo();
    AppConfig appConfig = appRepo0.loadAppConfig(appData);
    expect(appConfig.appTheme, isNotNull);
    expect(appConfig.widgets, isNotEmpty);
    expect(appConfig.widgets.first.widgetType, isNotNull);
  });

  test("App Repo Failure Test", () async {
    AppRepo appRepo = AppRepo();
    expect(
      () {
        appRepo.loadAppConfig("""
    {
    "app":{
      "theme":"light"
   },
   "widgets":[
      {
         "type":"banner",
         "image":"https://i0.wp.com/post.healthline.com/wp-content/uploads/2022/11/2602810-13-Best-Prepared-Meal-Delivery-Services-of-2022-Header-81b9bf.jpg?w=1155&h=1528",
         "header_text":"New Recipe",
         "footer_text":"Cook Chicken Curry",
         "footer_icon":true,
         "padding": 20.0,
         "border_radius": 12.0
      },
    ]
    }
    """);
      },
      throwsA(isInstanceOf<FormatException>()),
    );
  });
}
