import 'package:flutter/material.dart';
import 'package:flutter_learn/modules/navigationdemo/screen2.dart';

import 'package:flutter_learn/utils/helpers/app_const.dart';
import '../../utils/helpers/app_color.dart';
import '../../utils/helpers/app_routes.dart';

class ScreenthreeDemo extends StatefulWidget {
  const ScreenthreeDemo({super.key});

  @override
  State<ScreenthreeDemo> createState() => _Screen3State();
}

class _Screen3State extends State<ScreenthreeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConst.screen3),
        backgroundColor: AppColors.blue,
      ),
      backgroundColor: AppColors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppConst.screen3,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: const Text(AppConst.screen3),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ScreentwoDemo(),
                    settings: const RouteSettings(
                        name: AppRoutes.screenRoute3,
                        arguments: "screen three"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
