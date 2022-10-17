import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static final PreferencesHelper prefs = PreferencesHelper._internal();
  PreferencesHelper._internal();
  factory PreferencesHelper() => prefs;
  SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  bool? getBool(String key) {
    return _sharedPreferences?.getBool(key);
  }

  setBool({required String key, required bool value}) {
    _sharedPreferences?.setBool(key, value);
  }
}
