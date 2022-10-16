import 'package:flutter_learn/utils/helpers/app_const.dart';

class Validation {
  static String? nameValidation(String? text) {
    String name = text ?? '';

    if (name.trim().isEmpty) {
      return AppConst.nameempty;
    }

    return null;
  }

  static String? emailValidation(String? text) {
    String email = text ?? '';

    if (email.trim().isEmpty) {
      return AppConst.emailempty;
    }

    return null;
  }

  static String? passwordValidation(String? text) {
    String password = text ?? '';
    if (password.trim().isEmpty) {
      return AppConst.passwordempty;
    } else if (password.trim().length < 8) {
      return AppConst.passwordCount;
    }
    return null;
  }

  static String? phoneNumberValidation(String? text) {
    String phoneNumber = text ?? '';

    if (phoneNumber.trim().isEmpty) {
      return AppConst.numberempty;
    } else if (phoneNumber.trim().length < 8) {
      return AppConst.numbercount;
    }

    return null;
  }
}
//regrule
//appinteger
