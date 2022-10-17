import 'package:flutter_learn/utils/helpers/app_preferences/preference_helper.dart';

class Preference {
  static setIsTutorialViewed(bool value) {
    PreferencesHelper.prefs.setBool(
      key: PrefencesConstkey.kIsTutorialViewed,
      value: value,
    );
  }

  static bool? get isTutorialViewed =>
      PreferencesHelper.prefs.getBool(PrefencesConstkey.kIsTutorialViewed);
}

class PrefencesConstkey {
  static const String kIsTutorialViewed = "testing_value";
}
