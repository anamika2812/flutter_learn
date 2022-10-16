import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/helpers/app_const.dart';
import 'package:flutter_learn/utils/helpers/app_routes.dart';
import '../../utils/helpers/app_color.dart';
import 'screen5.dart';

class ScreenfourDemo extends StatefulWidget {
  const ScreenfourDemo({super.key});

  @override
  State<ScreenfourDemo> createState() => _Screen4State();
}

class _Screen4State extends State<ScreenfourDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConst.screen4),
        backgroundColor: AppColors.blue,
      ),
      backgroundColor: AppColors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppConst.screen4,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: const Text(AppConst.screen4),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const ScreenfiveDemo(),
                      settings: const RouteSettings(
                          name: AppRoutes.screenRoute5,
                          arguments: "screen four"),
                    ), (route) {
                  return route.settings.name == AppRoutes.screenRoute2;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
