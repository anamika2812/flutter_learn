import 'package:flutter/material.dart';
import 'package:flutter_learn/modules/navigationdemo/screen2.dart';
import 'package:flutter_learn/utils/helpers/app_const.dart';
import 'package:flutter_learn/utils/helpers/app_routes.dart';
import 'package:flutter_learn/utils/helpers/app_style.dart';
import '../../utils/helpers/app_color.dart';
import '../../utils/helpers/global.dart';

class ScreenoneDemo extends StatefulWidget {
  const ScreenoneDemo({super.key});

  @override
  State<ScreenoneDemo> createState() => _Screen1State();
}

class ScreenArguments {
  final String message;

  ScreenArguments(this.message);
}

class _Screen1State extends State<ScreenoneDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConst.screen1),
        backgroundColor: AppColors.blue,
      ),
      backgroundColor: AppColors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildshowtext(),
            _buildsizeBox(),
            _buildshowButtonWithPush(),
            _buildsizeBox(),
            _buildshowButtonWithPushNamed(),
          ],
        ),
      ),
    );
  }

  Widget _buildsizeBox() {
    return const SizedBox(child: AppStyle.appsizebox);
  }

  Widget _buildshowtext() {
    return const Text(
      AppConst.screen1,
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildshowButtonWithPush() {
    return ElevatedButton(
      onPressed: () async {
        final backData = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ScreentwoDemo(
              data: "Happy Text Here!!!! ",
            ),
            settings: const RouteSettings(
                name: AppRoutes.screenRoute2, arguments: "screen two"),
          ),
        );
        printDebug(backData);
      },
      child: const Text(AppConst.screen1),
    );
  }

  Widget _buildshowButtonWithPushNamed() {
    return ElevatedButton(
      onPressed: () async {
        final backarg = await Navigator.pushNamed(
          context,
          AppRoutes.screenRoute5,
          arguments: ScreenArguments(
            AppConst.screnargumentdata,
            //send arugument as a data
          ),
        );
        printDebug(backarg!);
      },
      child: const Text(AppConst.navigatetext),
    );
  }
}
