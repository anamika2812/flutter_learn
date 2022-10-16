import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/helpers/app_color.dart';

class AppStyle {
  static const TextStyle buttonsignup = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      fontFamily: "Roboto",
      color: AppColors.white);

  static ButtonStyle signupButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.red),
      padding: MaterialStateProperty.all(const EdgeInsets.all(10)));

  static const TextStyle titlestyle = TextStyle(
    fontSize: 30.0,
    color: AppColors.red,
    fontWeight: FontWeight.w700,
    fontFamily: "Roboto",
  );

  static const TextStyle button = TextStyle(color: AppColors.red);

  static const SizedBox appsizebox = SizedBox(
    height: 30,
  );
}
