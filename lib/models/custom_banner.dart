import 'package:flutter/material.dart';
import 'package:ui_renderer/enums/widget_type.dart';
import 'package:ui_renderer/models/custom_widget.dart';

class CustomBanner extends CustomWidget {
  final String? image;
  final Color? color;
  final String? headerText;
  final String? footerText;
  final bool? footerIcon;

  CustomBanner({
    super.widgetType,
    this.image,
    this.color,
    this.headerText,
    this.footerText,
    this.footerIcon,
  });

  static CustomBanner fromJson(final Map<String, dynamic> json) {
    return CustomBanner(
      widgetType: getWidgetTypeFromString(json['type']),
      image: json['image'],
      color: _jsonToColor('color', json),
      headerText: json['header_text'],
      footerText: json['footer_text'],
      footerIcon: json['footer_icon'],
    );
  }
  static List<CustomBanner> listFromJson(final List<dynamic>? jsons) {
    if (jsons == null) {
      return <CustomBanner>[];
    } else {
      return jsons.map<CustomBanner>((final dynamic json) {
        return CustomBanner.fromJson(json);
      }).toList();
    }
  }

  static Color? _jsonToColor(String key, Map<String, dynamic> json) {
    if (json[key] == null || json[key] == '') {
      return null;
    } else {
      String? colorString = json[key];
      if (colorString != null) {
        if (colorString.startsWith("0xFF")) {
          int? colorInt = int.tryParse(colorString);
          if (colorInt != null) {
            return Color(colorInt);
          }
        } else {
          int? colorInt = int.tryParse("0xFF$colorString");
          if (colorInt != null) {
            return Color(colorInt);
          }
        }
      }
      return null;
    }
  }
}
