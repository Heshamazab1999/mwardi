import 'package:mwardi/app/util/serialization/serialization_lib.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalCacheService extends AbsCacheService {
  static SharedPreferences? _prefs;

  ///no problem calling it many times
  @override
  Future init() async {
    if (_prefs != null) return;
    _prefs = await SharedPreferences.getInstance();
  }

  ///you must call init() before calling it
  @override
  Future storeString(String key, String value) async {
    await _prefs!.setString(key, value);
  }

  @override
  Future storeBool(String key, bool value) async {
    await _prefs!.setBool(key, value);
  }

  ///you must call init() before calling it
  @override
  String? retrieveString(String key) {
    return _prefs!.getString(key);
  }

  @override
  bool? retrieveBool(String key) {
    return _prefs!.getBool(key);
  }

  ///you must call init() before calling it
  @override
  Future remove(String key) async {
    await _prefs!.remove(key);
  }

  ///you must call init() before calling it
  @override
  bool keyExists(String key) {
    return _prefs!.containsKey(key);
  }

  @override
  Future<void> clearAll() async {
    await _prefs!.clear();
  }
}

abstract class AbsCacheService {
  Future<void> init();

  Future<void> storeString(String key, String value);

  Future<void> storeBool(String key, bool value);

  String? retrieveString(String key);

  bool? retrieveBool(String key);

  Future<void> remove(String key);

  Future<void> clearAll();

  bool keyExists(String key);

  T? retrieveObject<T extends Serializable>(String key, T instance) {
    var text = retrieveString(key);
    if (text == null || text == 'null') return null;
    //
    return JsonSerializer().deserializeObject(text, instance);
  }

  Future<void> storeObject<T extends Serializable>(String key, T value) {
    return storeString(key, JsonSerializer().serializeObject(value));
  }

  List<T>? retrieveList<T extends Serializable>(
      String key, T Function() creator) {
    var text = retrieveString(key);
    if (text == null || text == 'null') return null;
    //
    return JsonSerializer().deserializeList(text, creator);
  }

  Future<void> storeList<T extends Serializable>(String key, List<T> value) {
    return storeString(key, JsonSerializer().serializeList(value));
  }
}
