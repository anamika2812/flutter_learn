import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/helpers/app_color.dart';
import 'package:flutter_learn/utils/helpers/app_const.dart';
import 'package:flutter_learn/utils/helpers/app_dimension.dart';
import 'package:flutter_learn/utils/helpers/app_routes.dart';

import '../../utils/helpers/app_preferences/preference.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _navigateToNextScreen(context);
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://picsum.photos/id/1074/400/400',
            width: MediaQuery.of(context).size.width,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            AppConst.screentext,
            style: TextStyle(
              fontSize: AppDim.size25,
              fontWeight: FontWeight.w700,
              letterSpacing: 8,
              wordSpacing: 20,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      bool valueViewed = Preference.isTutorialViewed ?? false;
      if (valueViewed) {
        Navigator.pushNamed(context, AppRoutes.signupScreen);
      } else {
        Navigator.pushNamed(context, AppRoutes.tutorialScreen);
      }
    });
  }
}
