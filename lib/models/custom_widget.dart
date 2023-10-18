import 'package:ui_renderer/enums/widget_type.dart';
import 'package:ui_renderer/models/custom_banner.dart';
import 'package:ui_renderer/models/banner_carousal.dart';
import 'package:ui_renderer/models/horizontal_list.dart';

class CustomWidget {
  final WidgetType? widgetType;

  CustomWidget({
    this.widgetType,
  });

  static CustomWidget fromJson(final Map<String, dynamic> json) {
    WidgetType? widgetType = getWidgetTypeFromString(json['type']);
    switch (widgetType) {
      case WidgetType.banner:
        return CustomBanner.fromJson(json);
      case WidgetType.horizontalList:
        return HorizontalList.fromJson(json);
      case WidgetType.bannerCarousal:
        return BannerCarousal.fromJson(json);
      default:
        return CustomWidget(
          widgetType: getWidgetTypeFromString(
            json['type'],
          ),
        );
    }
  }

  static List<CustomWidget> listFromJson(final List<dynamic>? jsons) {
    if (jsons == null) {
      return <CustomWidget>[];
    } else {
      return jsons.map<CustomWidget>((final dynamic json) {
        return CustomWidget.fromJson(json);
      }).toList();
    }
  }
}
