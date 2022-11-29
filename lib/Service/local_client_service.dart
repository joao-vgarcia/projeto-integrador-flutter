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

  Future<void> setString(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  Future<void> setStringList(String key, List<String> value) async {
    await sharedPreferences.setStringList(key, value);
  }
  
  Future<void> remove(String key) async {
    await sharedPreferences.remove(key);
  }

  Future<void> setBool(String key, bool value) async{
    await sharedPreferences.setBool(key, value);
  }
}
