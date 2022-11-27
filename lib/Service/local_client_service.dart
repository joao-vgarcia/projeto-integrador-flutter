import 'package:shared_preferences/shared_preferences.dart';

class LocalClientService {
  final SharedPreferences sharedPreferences;

  LocalClientService(this.sharedPreferences);

  String getString(String key) {
    return sharedPreferences.getString(key) ?? '';
  }

  List<String> getStringList(String key) {
    return sharedPreferences.getStringList(key) ?? [];
  }

  bool getBool(String key) {
    return sharedPreferences.getBool(key) ?? false;
  }

  void setString(String key, String value) {
    sharedPreferences.setString(key, value);
  }

  void setStringList(String key, List<String> value) {
    sharedPreferences.setStringList(key, value);
  }

  void setBool(String key, bool value) {
    sharedPreferences.setBool(key, value);
  }
}
