import 'package:get/get.dart';
import 'package:mwardi/app/data/managers/cache_manager/cache_manager.dart';
import 'package:mwardi/app/data/services/cache/cache.dart';
import 'package:mwardi/app/data/services/connectivity/connectivity.dart';
import 'package:mwardi/app/data/services/http/http_service.dart';
import 'package:mwardi/app/data/services/http/i_http_service.dart';
import 'package:mwardi/app/data/services/logger/logger.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    //logger
    Get.lazyPut<AbsLogger>(() => DebugLogger());

    // cache service
    Get.put<AbsCacheService>(LocalCacheService()).init();

    // cache manager
    Get.put<ICacheManager>(CacheManager(Get.find<AbsCacheService>()));

    // connectivity
    Get.put<IConnectivityService>(ConnectivityService(Get.find<AbsLogger>()));

    // http Service
    Get.put<IHttpService>(HttpService(Get.find<AbsLogger>()));
  }
}
