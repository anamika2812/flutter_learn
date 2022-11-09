import 'package:flutter/material.dart';
import 'package:flutter_learn/modules/tutorial/view/tutorial_page_view.dart';

import 'package:flutter_learn/utils/helpers/app_const.dart';
import 'package:flutter_learn/utils/helpers/app_routes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("testing tutorial", (widgetTester) async {
    Widget widget = MaterialApp(
      title: AppConst.demotilte,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const TutorialPage(),
      routes: AppRoutes.getRoutes(),
      debugShowCheckedModeBanner: false,
    );
    await widgetTester.pumpWidget(widget);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(seconds: 3));
    await widgetTester.pumpAndSettle();
    await widgetTester.longPress(find.byType(GestureDetector).first);
    await widgetTester.tap(find.byType(InkWell).first);
    await widgetTester.tap(find.byType(TextButton));
  });
}
