import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mwardi/app/data/managers/cache_manager/cache_manager.dart';
import 'package:mwardi/app/routes/app_pages.dart';

import '../../../data/managers/api_manager/auth.manager.dart';
import '../../../data/models/login_response/login_response.dart';
import '../../../data/services/logger/logger.dart';
import '../../../util/action_center/action_center.dart';

class LoginController extends GetxController {
  final _obSecure = true.obs;
  String? email;
  String? emailVerify;
  String? otp;
  String? rechangePass;
  String? password;
  String? confirmPassword;
   final agree = false.obs;
  final AuthManager _authManager = AuthManager(Get.find());
  final ActionCenter _actionCenter = ActionCenter(Get.find<AbsLogger>());

  bool get obSecure => _obSecure.value;

  toggleObSecure() {
    _obSecure.value = !_obSecure.value;
  }

  agreeFunc(value) {
    agree.value = value ?? false;
    print(agree.value);
  }

  RxBool loading = false.obs;
  login() async {
    LoginResponse? loginResponse;
        var devToken= await Get.find<ICacheManager>().getStringData('deviceToken');
    if (agree.isFalse) {
      return;
    }
    loading.value = true;
    var result = (await _actionCenter.execute(
      () async {
        String? devID = await getDeviceId();
        loginResponse = await _authManager.login(
          deviceId: devID ?? "",
          fcmToken: devToken??'',
          loginId: 'essam.mamdouh@bobrgroup.com',
          // loginId: email!.trim(),
          password: '123456789',
          // password: password!.trim(),
        );
      },
      checkConnection: true,
    ));
    loading.value = false;
    if (result && loginResponse != null) {
      // caching user data
      Get.find<ICacheManager>().setProfileData(loginResponse!.data!);

      //Go to HomeScreen
      Get.offAllNamed(Routes.HOME);
    }
  }

  Future<String?> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id;
    }
    return null;
  }
  Future<dynamic> sendOtp()async{
    loading.value = true;
    var res;
      var result=await _actionCenter.execute(() async{
        res= await _authManager.sendOtp(email: emailVerify!.trim().toString());
        // res= await _authManager.sendOtp(email: 'essam.mamdouh@bobrgroup.com');
        },checkConnection: true,
      );
      loading.value = false;

      if (result ) {
      Get.offAllNamed(Routes.OTP);
      await Get.find<ICacheManager>().setProfileData(res!.data!);
       print(result);
    }



  }
  verifOtpy( ) async {
    loading.value = true;
    var res;
    var result=await _actionCenter.execute(() async{
      res= await _authManager.verifyOtp(code: otp, email: emailVerify!.trim());
        },checkConnection: true,
    );
    loading.value = false;
    if (result ) {
        print(result);
        print('ok');
      Get.offAllNamed(Routes.RECHANGE);
    }
    else{
      print('error');
    }
  }
  rechangePassword()async{
    loading.value = true;
    var res;
    var result=await _actionCenter.execute(() async{
      res= await _authManager.rechangePassword(password: rechangePass, email: emailVerify.toString());
      },checkConnection: true,
    );
    loading.value = false;
    if (result && res != null) {
      // caching user data
      Get.find<ICacheManager>().setProfileData(res!.data!);

      //Go to HomeScreen
      Get.offAllNamed(Routes.HOME);
    }

    }
  }
