import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();
  factory LocalStorage() => _instance;
  LocalStorage._internal();

  SharedPreferences? _prefs;

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setUsername(String username) async {
    await _prefs?.setString('username', "username");
  }

  String getUsername() {
    return _prefs?.getString('username') ??
        'User'; // Ternary Operator dan Getter
  }
}
