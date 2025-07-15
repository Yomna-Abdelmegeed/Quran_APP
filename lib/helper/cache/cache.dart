import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static late final SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveEligibility() async {
    bool result = await prefs.setBool('onBoarding', true);
    return result;
  }

  static bool? getEligibility() {
    return prefs.getBool('onBoarding');
  }
}
