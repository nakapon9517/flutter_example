import 'package:shared_preferences/shared_preferences.dart';

// TODO parseなどで他の型も扱えないか

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
    if (isType<T, int>()) prefs.setInt(key, item as int);
    if (isType<T, bool>()) prefs.setBool(key, item as bool);
    if (isType<T, double>()) prefs.setDouble(key, item as double);
    if (isType<T, String>()) prefs.setString(key, item as String);
    if (isType<T, List<String>>())
      prefs.setStringList(key, item as List<String>);
  }

  @override
  Future<void> remove(String key) async {
    SharedPreferences prefs = await _prefs;
    prefs.remove(key);
  }
}
