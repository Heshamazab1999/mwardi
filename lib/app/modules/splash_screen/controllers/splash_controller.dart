import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mwardi/app/data/managers/cache_manager/cache_manager.dart';
import 'package:mwardi/app/routes/app_pages.dart';

import '../../home/views/home_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () async {
      getDeviceToken();
      String? token = Get.find<ICacheManager>().getToken();
      print ("token is $token");
      if (token != null) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    });

  }
}
getDeviceToken()async{
   FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance; // Change here
  await _firebaseMessaging.getToken().then((token) async {
     Get.find<ICacheManager>().setStringData('deviceToken',token.toString());

   });
 }