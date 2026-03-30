import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences sharedPreferences;

  PreferencesService(this.sharedPreferences);

// Save data with type-specific handling
  Future<bool> setData({required String key, required dynamic value}) async {
    try {
      if (value is String) {
        return await sharedPreferences.setString(key, value);
      } else if (value is bool) {
        return await sharedPreferences.setBool(key, value);
      } else if (value is int) {
        return await sharedPreferences.setInt(key, value);
      } else if (value is double) {
        return await sharedPreferences.setDouble(key, value);
      } else if (value is List<String>) {
        return await sharedPreferences.setStringList(key, value);
      } else {
        return false; // Invalid type
      }
    } catch (e) {
      // Handle errors if needed
      return false;
    }
  }

  // Get data with type-specific methods
  String? getString({required String key}) => sharedPreferences.getString(key);
  bool? getBool({required String key}) => sharedPreferences.getBool(key);
  int? getInt({required String key}) => sharedPreferences.getInt(key);
  double? getDouble({required String key}) => sharedPreferences.getDouble(key);
  List<String>? getStringList({required String key}) =>
      sharedPreferences.getStringList(key);

  // General getter (optional, for flexibility)
  Object? getData({required String key}) => sharedPreferences.get(key);

  // Clear all stored data
  Future<bool> clear() async {
    return await sharedPreferences.clear();
  }

  // Delete a specific key
  Future<bool> delete({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
