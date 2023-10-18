import 'package:ui_renderer/enums/widget_type.dart';
import 'package:ui_renderer/models/custom_banner.dart';
import 'package:ui_renderer/models/custom_widget.dart';

class BannerCarousal extends CustomWidget {
  List<CustomBanner> banners;

  BannerCarousal({
    required this.banners,
    super.widgetType,
  });

  static BannerCarousal fromJson(final Map<String, dynamic> json) {
    return BannerCarousal(
      widgetType: getWidgetTypeFromString(json['type']),
      banners: CustomBanner.listFromJson(json['banners']),
    );
  }

  bool get isValid {
    return banners.length >= 2;
  }
}
