import 'package:shared_preferences/shared_preferences.dart';

abstract class ILocalStorageRepository<T> {
  Future<T?> getAll(String key);
  Future<void> save(String key, T item);
  Future<void> remove(String key);
}

class LocalStorageRepository<T> extends ILocalStorageRepository<T> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool isType<T1, T2>() => T1 == T2;

  @override
  Future<T?> getAll(String key) async {
    SharedPreferences prefs = await _prefs;
    if (isType<T, int>()) return prefs.getInt(key) as T?;
    if (isType<T, bool>()) return prefs.getBool(key) as T?;
    if (isType<T, double>()) return prefs.getDouble(key) as T?;
    if (isType<T, String>()) return prefs.getString(key) as T?;
    if (isType<T, List<String>>()) return prefs.getStringList(key) as T?;
    throw Exception('not supported type');
  }

  @override
  Future<void> save(String key, T item) async {
    SharedPreferences prefs = await _prefs;
    if (item is int) prefs.setInt(key, item);
    if (item is bool) prefs.setBool(key, item);
    if (item is double) prefs.setDouble(key, item);
    if (item is String) prefs.setString(key, item);
    if (item is List<String>) prefs.setStringList(key, item);
    throw Exception('not supported type');
  }

  @override
  Future<void> remove(String key) async {
    SharedPreferences prefs = await _prefs;
    prefs.remove(key);
  }
}
