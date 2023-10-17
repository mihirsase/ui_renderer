import 'package:ui_renderer/enums/app_theme.dart';
import 'package:ui_renderer/models/custom_widget.dart';

class AppConfig {
  final AppTheme? appTheme;
  final List<CustomWidget>? widgets;

  AppConfig({
    this.appTheme,
    this.widgets,
  });

  static AppConfig fromJson(final Map<String, dynamic> json) {
    return AppConfig(
      appTheme: getAppThemeFromString(json['app']['theme']),
      widgets: CustomWidget.listFromJson(json['widgets']),
    );
  }
}

