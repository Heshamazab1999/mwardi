import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mwardi/app/common/app_colors.dart';
import 'package:mwardi/app/modules/home/views/components/custom_drawer.dart';
import '../../../common/constants/data.dart';
import '../../../helper/connectivity.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
    HomeView({super.key});
  static final HomeController controller = Get.find<HomeController>();
  final connection = Get.put(ConnectionStatusSingleton());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        extendBody: true,
        body:   Obx(() => connection.connectivity.value == 1  ?
        SafeArea(child:   Obx(() => screensWithTitle[controller.activePage.value].first))
            :
        Scaffold(
            body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/ic_no_connection.png',
                      height: 300,
                      width: 300,
                      color: AppColors.secondaryColor,
                    ),
                    Text(
                      'no_connection'.tr,
                      style: TextStyle(
                          fontSize: 25,
                          color:AppColors.secondaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )))
        ),






        bottomNavigationBar: Obx(() => CurvedNavigationBar(
              index: 0,
              items: <Widget>[
                Icon(
                  Icons.home_rounded,
                  size: 26,
                  color: controller.activePage.value == 0
                      ? AppColors.whiteColor
                      : AppColors.greyColor,
                ),
                Icon(
                  Icons.airplay_rounded,
                  size: 26,
                  color: controller.activePage.value == 1
                      ? AppColors.whiteColor
                      : AppColors.greyColor,
                ),
                Icon(
                  Icons.calendar_month_outlined,
                  size: 26,
                  color: controller.activePage.value == 2
                      ? AppColors.whiteColor
                      : AppColors.greyColor,
                ),
              ],
              color: Colors.white,
              buttonBackgroundColor: AppColors.secondaryColor,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 300),
              onTap: (index) {
                controller.jumpToPage(index);
              },
              letIndexChange: (index) => true,
            )));
  }
}
