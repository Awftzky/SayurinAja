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
    await _prefs?.setString('username', username);
  }

  String getUsername() {
    return _prefs?.getString('username') ??
        'User'; // Ternary Operator dan Getter
  }

  Future<void> saveLastKnownLocation(double latitude, double longitude) async {
    await _prefs?.setDouble('last_latitude', latitude);
    await _prefs?.setDouble('last_longitude', longitude);
  }

  Map<String, double>? getLastKnownLocation() {
    final lat = _prefs?.getDouble('last_latitude');
    final lng = _prefs?.getDouble('last_longitude');

    if (lat != null && lng != null) {
      return {'latitude': lat, 'longitude': lng};
    }
    return null;
  }
}
