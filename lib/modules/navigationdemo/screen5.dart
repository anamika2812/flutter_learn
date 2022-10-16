import 'package:flutter/material.dart';
import 'package:flutter_learn/modules/navigationdemo/screen1.dart';
import 'package:flutter_learn/utils/helpers/app_const.dart';
import '../../utils/helpers/app_color.dart';

class ScreenfiveDemo extends StatefulWidget {
  const ScreenfiveDemo({super.key});

  @override
  State<ScreenfiveDemo> createState() => _Screen5State();
}

class _Screen5State extends State<ScreenfiveDemo> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as ScreenArguments; //pushNamed

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConst.screen5),
        backgroundColor: AppColors.blue,
      ),
      backgroundColor: AppColors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppConst.screen5,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            Center(
              child: Text(args.message), //pushed named
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: const Text(AppConst.screen5),
              onPressed: () {
                Navigator.of(context).pop(AppConst.backscreendata);
              },
            ),
          ],
        ),
      ),
    );
  }
}
