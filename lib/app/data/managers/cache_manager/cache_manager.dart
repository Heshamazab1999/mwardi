import 'package:get/get.dart';
import 'package:mwardi/app/data/models/login_response/data.dart' as EMPLOYEE;
import 'package:mwardi/app/data/services/cache/cache.dart';

class CacheManager extends GetxService implements ICacheManager {
  final AbsCacheService _cacheService;

  CacheManager(this._cacheService);

  final String userDataKey = 'UserData';

  @override
  void onInit() {
    super.onInit();
    _cacheService.init();
  }

  @override
  Future<void> clearUserData() {
    return _cacheService.remove('userData');
  }

  @override
  Future<void> init() async {
    await _cacheService.init();
  }

  @override
  Future<void> setStringData(String key, String value) {
    return _cacheService.storeString(key, value);
  }

  @override
  Future<void> setBoolData(String key, bool value) {
    return _cacheService.storeBool(key, value);
  }

  @override
  String? getStringData(String key) {
    return _cacheService.retrieveString(key);
  }

  @override
  bool? getBoolData(String key) {
    return _cacheService.retrieveBool(key);
  }

  @override
  Future<void> clearAllData() {
    return _cacheService.clearAll();
  }


  @override
  String? getToken() {
    var employeeData = getUserData();
    return employeeData?.token;
  }

  @override
  Future<void> setProfileData(EMPLOYEE.Data employeeData) {
    return _cacheService.storeString(userDataKey, employeeData.toJson());
  }

  @override
  EMPLOYEE.Data? getUserData() {
    return EMPLOYEE.Data.fromJson(
        _cacheService.retrieveString(userDataKey) ?? "{}");
  }


}

abstract class ICacheManager {
  Future<void> init();

  String? getStringData(String key);

  bool? getBoolData(String key);

  String? getToken();

  EMPLOYEE.Data? getUserData();

  Future<void> setProfileData(EMPLOYEE.Data employeeData);

  Future<void> setStringData(String key, String value);

  Future<void> setBoolData(String key, bool value);

  Future<void> clearUserData();

  Future<void> clearAllData();
}
