// ignore: duplicate_ignore
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/helpers/app_const.dart';
import 'package:flutter_learn/utils/helpers/app_routes.dart';
import 'modules/navigationdemo/screen1.dart';
import 'modules/signup/view/signupform.dart';
import 'modules/tutorial/view/tutorial_page_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConst.demotilte,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.getRoutes(),
      // home: const ScreenoneDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}
