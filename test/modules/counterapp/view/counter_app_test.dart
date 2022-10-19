import 'package:flutter/material.dart';
import 'package:flutter_learn/modules/counterapp/view/counter_app.dart';
import 'package:flutter_learn/utils/helpers/app_const.dart';
import 'package:flutter_learn/utils/helpers/app_routes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("testing counter app", (widgetTester) async {
    Widget widget = MaterialApp(
      title: AppConst.demotilte,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const CounterAppScreen(),
      routes: AppRoutes.getRoutes(),
      debugShowCheckedModeBanner: false,
    );
    await widgetTester.pumpWidget(widget);
    await widgetTester.pumpAndSettle();
    await widgetTester.tap(find.byType(FloatingActionButton));
  });
}
