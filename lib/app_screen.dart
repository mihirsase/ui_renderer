import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_renderer/components/banner_carousal_widget.dart';
import 'package:ui_renderer/components/banner_widget.dart';
import 'package:ui_renderer/components/horizontal_list_widget.dart';
import 'package:ui_renderer/controllers/app_controller.dart';
import 'package:ui_renderer/enums/app_theme.dart';
import 'package:ui_renderer/enums/widget_type.dart';
import 'package:ui_renderer/models/banner_carousal.dart';
import 'package:ui_renderer/models/custom_banner.dart';
import 'package:ui_renderer/models/custom_widget.dart';
import 'package:ui_renderer/models/horizontal_list.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final AppController _appController = AppController();

  @override
  void initState() {
    super.initState();
    _appController.load();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_appController.appConfig.appTheme == AppTheme.dark) {
        Get.changeTheme(ThemeData.dark(useMaterial3: true));
      } else {
        Get.changeTheme(ThemeData.light(useMaterial3: true));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 32,
          ),
          ..._appController.appConfig.widgets.map((final CustomWidget customWidget) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                getCustomWidget(customWidget),
                const SizedBox(
                  height: 22,
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget getCustomWidget(CustomWidget customWidget) {
    switch (customWidget.widgetType) {
      case WidgetType.banner:
        return BannerWidget(
          banner: customWidget as CustomBanner,
        );
      case WidgetType.horizontalList:
        return HorizontalListWidget(
          horizontalList: customWidget as HorizontalList,
        );
      case WidgetType.bannerCarousal:
        return BannerCarousalWidget(
          bannerCarousal: customWidget as BannerCarousal,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
