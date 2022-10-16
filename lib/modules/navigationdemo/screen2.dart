import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/helpers/app_const.dart';
import '../../utils/helpers/app_color.dart';

class ScreentwoDemo extends StatefulWidget {
  const ScreentwoDemo({super.key, this.data = "welcome"});

  final String data;

  @override
  State<ScreentwoDemo> createState() => _Screen2State();
}

class _Screen2State extends State<ScreentwoDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConst.screen2),
        backgroundColor: AppColors.blue,
      ),
      backgroundColor: AppColors.lightgreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildshowtext(),
            const SizedBox(
              height: 30,
            ),
            _buildshowbutton()
          ],
        ),
      ),
    );
  }

  Widget _buildshowtext() {
    return Text(
      widget.data,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildshowbutton() {
    return ElevatedButton(
      child: const Text(AppConst.screen2),
      onPressed: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ScreenthreeDemo(),
        //     settings: const RouteSettings(
        //         name: AppRoutes.screenRoute3, arguments: "screen two"),
        //   ),
        // );

        Navigator.of(context).pop('hello back');
      },
    );
  }
}
