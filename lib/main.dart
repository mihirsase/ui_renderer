import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_renderer/app_screen.dart';

void main() {
  runApp(const UIRenderer());
}

class UIRenderer extends StatelessWidget {
  const UIRenderer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget!,
        );
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.light,
      home: const AppScreen(),
    );
  }
}
