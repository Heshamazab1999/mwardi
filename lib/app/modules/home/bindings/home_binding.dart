import 'package:get/get.dart';

import '../../login_screen/controller/login_controller.dart';
import '../../requests_screen/controllers/request_controller.dart';
import '../../splash_screen/controllers/splash_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(),);
    Get.lazyPut<LoginController>(() => LoginController(),);
    Get.lazyPut<RequestController>(() => RequestController(),);
    Get.lazyPut<SplashController>(() => SplashController(),);
   }
}
