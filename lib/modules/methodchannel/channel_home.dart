import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/helpers/app_color.dart';
import '../../utils/helpers/app_const.dart';
import '../../utils/helpers/global.dart';

const platform = MethodChannel('example.flutterLearn/dummy_channel');

class ChannelHomeScreen extends StatefulWidget {
  const ChannelHomeScreen({super.key});

  @override
  State<ChannelHomeScreen> createState() => _ChannelHomeScreenState();
}

class _ChannelHomeScreenState extends State<ChannelHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.blue,

        leading: IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            color: AppColors.white,
          ), // Icon

          onPressed: () {},
        ), // IconButton

        title: const Text(
          AppConst.demotilte,
          textAlign: TextAlign.center,
        ), // Text
      ), // AppBar

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  callDummyMethodChannel();
                },
                child: const Text('Dummy'))
          ],
        ),
      ), // Padding
    ); // Scaffold // ElevatedButton
  }

  callDummyMethodChannel() async {
    String data = "";
    try {
      final String result = await platform.invokeMethod('getDummyData');
      data = result;
    } catch (e) {
      data = e.toString();
    }

    printDebug(data);
  }
}
