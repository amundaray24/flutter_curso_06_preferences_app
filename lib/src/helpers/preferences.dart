import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  static late SharedPreferences _preferences;
  static String _name = '';
  static bool _isDark = false;
  static int _gender = 0;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String get name => _preferences.getString('name') ?? _name;

  static bool get isDark => _preferences.getBool('isDark') ?? _isDark;

  static int get gender => _preferences.getInt('gender') ?? _gender;

  static set name(String value) {
    _name = value;
    _preferences.setString('name', value);
  }

  static set isDark(bool value) {
    _isDark = value;
    _preferences.setBool('isDark', value);
  }

  static set gender(int value) {
    _gender = value;
    _preferences.setInt('gender', value);
  }
}