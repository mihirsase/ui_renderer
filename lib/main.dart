import 'package:flutter/material.dart';
import 'package:ui_renderer/app_screen.dart';

void main() {
  runApp(const UIRenderer());
}

class UIRenderer extends StatelessWidget {
  const UIRenderer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget!,
        );
      },
      debugShowCheckedModeBanner: false,
      home: const AppScreen(),
    );
  }
}
