// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_renderer/components/banner_widget.dart';
import 'package:ui_renderer/enums/widget_type.dart';

import 'package:ui_renderer/models/custom_banner.dart';

void main() {
  testWidgets('Valid Banner Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BannerWidget(
            key: const Key("banner_widget"),
            banner: CustomBanner(
              widgetType: WidgetType.banner,
              color: Colors.red,
              headerText: "ABC",
              footerText: "XYZ",
              footerIcon: true,
            ),
          ),
        ),
      ),
    );

    await tester.pump(const Duration(seconds: 2));
    var bannerWidgetFinder = find.byKey(const Key('banner_widget'));
    expect(bannerWidgetFinder, findsOneWidget);

    expect(find.byType(Placeholder), findsNothing);
    expect(find.text('ABC'), findsOneWidget);
    expect(find.text('XYZ'), findsOneWidget);
    expect(find.widgetWithIcon(Row, Icons.arrow_forward), findsWidgets);
  });

  testWidgets('Invalid Banner Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BannerWidget(
            key: const Key("banner_widget"),
            banner: CustomBanner(
              widgetType: WidgetType.banner,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );

    await tester.pump(const Duration(seconds: 2));
    var bannerWidgetFinder = find.byKey(const Key('banner_widget'));
    expect(bannerWidgetFinder, findsOneWidget);

    expect(find.byType(Placeholder), findsOneWidget);
  });
}
