import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/helpers/app_color.dart';

class AppSnackBar {
  static showSnackBar({
    required BuildContext context,
    required String message,
    bool isSuccess = false,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    var snackBar = SnackBar(
      backgroundColor: isSuccess ? AppColors.green : AppColors.red,
      content: Text(
        message,
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
