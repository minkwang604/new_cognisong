import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  SharedPreferences? _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveData(String key, dynamic value) async {
    if (value is String) {
      await _prefs?.setString(key, value);
    } else if (value is int) {
      await _prefs?.setInt(key, value);
    } else if (value is bool) {
      await _prefs?.setBool(key, value);
    } else if (value is double) {
      await _prefs?.setDouble(key, value);
    } else if (value is List<String>) {
      await _prefs?.setStringList(key, value);
    } else {
      throw ArgumentError('Invalid data type');
    }
  }

  dynamic getData(String key) {
    return _prefs?.get(key);
  }

  Future<void> removeData(String key) async {
    await _prefs?.remove(key);
  }

  Future<void> clearData() async {
    await _prefs?.clear();
  }
}
