import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mwardi/app/common/components/dialog.dart';
import 'package:mwardi/app/data/managers/api_manager/auth.manager.dart';
import 'package:mwardi/app/data/managers/cache_manager/cache_manager.dart';
import 'package:mwardi/app/data/models/login_response/login_response.dart';
import 'package:mwardi/app/data/services/logger/logger.dart';
import 'package:mwardi/app/modules/home/views/home_view.dart';
import 'package:mwardi/app/modules/login_screen/views/login_screen.dart';
import 'package:mwardi/app/util/action_center/action_center.dart';
import 'package:mwardi/app/data/models/login_response/data.dart' as EMPLOYEE;

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final ActionCenter _actionCenter = ActionCenter(Get.find<AbsLogger>());
  final AuthManager _authManager = AuthManager(Get.find());
  final date = "".obs;
  final activePage = 0.obs;
  final drawerPage = 0.obs;
  final isWorking = false.obs;
  // final isLoading = false.obs;

  final List<List> drawerScreens = [
    ["Home", Icons.home_outlined, HomeView()],
    ["Information", Icons.person_outline, HomeView()],
    ["Payroll", Icons.work_outline_rounded, HomeView()],
    ["Financial", Icons.attach_money_rounded, HomeView()],
    ["Documents", Icons.document_scanner_outlined, HomeView()],
    ["Assets", Icons.home_max_sharp, HomeView()],
    ["Log out", Icons.logout, HomeView()],
  ];

  Rx<EMPLOYEE.Data?> userData = EMPLOYEE.Data().obs;
  getUserData() {
    userData.value = Get.find<ICacheManager>().getUserData();
  }

  jumpToPage(int index) {
    activePage.value = index;
  }

  jumpToSidePage(index) {
    if (index + 1 == drawerScreens.length) {
      // logOut();
    }
    drawerPage.value = index;
    Get.back();
  }

  startOrStopWorking() {
    isWorking.value = !!!isWorking.value;
    if (isWorking.isFalse) {}
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    String? deviceToken = await Get.find<ICacheManager>().getStringData('deviceToken');
    print ("deviceToken is $deviceToken");

     getUserData();
  }

  logOut() async {
    var result = (await _actionCenter.execute(
      () async {
        await _authManager.logOut();
      },
      checkConnection: true,
    ));
    Get.back();
    if (result) {
      Get.offAllNamed(Routes.LOGIN);
      print("LogOut successfully!!");
    }
  }

  login() async {
    LoginResponse? loginResponse;

    var result = (await _actionCenter.execute(
      () async {
        loginResponse = await _authManager.login(
            deviceId: "c86836a77a157429",
            fcmToken: "ssss",
            loginId: "essam.mamdouh@bobrgroup.com",
            password: "12345678");
      },
      checkConnection: true,
    ));

    if (result) {
      print("Login successfully!!");
      print("${loginResponse?.data?.employee?.name ?? "unknown employee"}");
    }
  }

  @override
  void onReady() {
    super.onReady();
    date.value = DateFormat.yMMMMd('en_US').format(DateTime.now());
  }
}
