import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mwardi/app/common/app_assets.dart';
import 'package:mwardi/app/common/app_colors.dart';
import 'package:mwardi/app/common/app_text_styles.dart';
import 'package:mwardi/app/modules/home/controllers/home_controller.dart';
import 'package:slider_button/slider_button.dart';

import '../../../common/constants/data.dart';
import '../../../data/managers/api_manager/attendance_manager.dart';
import 'components/custom_drawer.dart';

class HomePageView extends GetView {
  const HomePageView({Key? key}) : super(key: key);
  static final HomeController _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Obx(() =>
            Text(screensWithTitle[_homeController.activePage.value].last)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: h * 0.05),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.0005),
                  spreadRadius: 0,
                  blurRadius: 40,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today, color: Colors.grey.withAlpha(120)),
                const SizedBox(width: 10),
                Obx(
                  () => Text(
                    _homeController.date.value,
                    style: AppTextStyles.greyTextStyle.copyWith(
                        fontSize: 20.0, color: Colors.grey.withAlpha(120)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: h * 0.05),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: const BorderRadiusDirectional.vertical(
                  top: Radius.circular(20)),
              color: AppColors.gradientLightBlueColor,
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 200,
                  image: AssetImage(AssetImages.starsEffect)),
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.gradientLightBlueColor,
                  AppColors.gradientLightBlueColor,
                  AppColors.gradientLightBlueColor,
                  AppColors.gradientLightBlueColor,
                  AppColors.gradientLightBlueColor,
                  AppColors.gradientLightBlueColor.withAlpha(250),
                  AppColors.gradientLightBlueColor.withAlpha(240),
                  AppColors.gradientLightBlueColor.withAlpha(230),
                  AppColors.gradientLightBlueColor.withAlpha(220),
                  AppColors.gradientLightBlueColor.withAlpha(210),
                  AppColors.gradientLightBlueColor.withAlpha(200),
                  AppColors.gradientLightBlueColor.withAlpha(190),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.0005),
                  spreadRadius: 0,
                  blurRadius: 40,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(children: [
              Text(
                "Let's get to work!",
                style: AppTextStyles.greyTextStyle
                    .copyWith(fontSize: 15.0, color: Colors.white),
              ),
              const SizedBox(height: 40),
              Text(
                _homeController.userData.value?.employee?.name ??
                    "".toUpperCase(),
                style: AppTextStyles.greyTextStyle.copyWith(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(height: 5),
              Text(
                _homeController.userData.value?.employee?.job ?? "",
                style: AppTextStyles.greyTextStyle.copyWith(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ]),
          ),
          TextButton(
              onPressed: () async {
                // AttendanceManager a=AttendanceManager(Get.find());
                // await  a.getAttendance();
              },
              child: Text(
                'data',
                style: TextStyle(color: Colors.black),
              )),
          SizedBox(
            height: h * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Meetings & Events",
                  style: AppTextStyles.blackTextStyle.copyWith(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                InkWell(
                  onTap: () => _homeController.jumpToPage(2),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withOpacity(0.0005),
                          spreadRadius: 0,
                          blurRadius: 40,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Check Today's Meetings & Events",
                                style: AppTextStyles.blackTextStyle.copyWith(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Today's meetings & events are waiting Click now to check them out",
                                style: AppTextStyles.greyTextStyle.copyWith(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.double_arrow,
                          color: AppColors.greyColor,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          Center(
              child: Obx(
            () => RotatedBox(
                quarterTurns: _homeController.isWorking.value ? 0 : 2,
                child: SliderButton(
                  action: () => _homeController.startOrStopWorking(),
                  label: RotatedBox(
                    quarterTurns: _homeController.isWorking.value ? 0 : 2,
                    child: Text(
                      _homeController.isWorking.value
                          ? "Slide right to start work"
                          : "Slide left to stop work",
                      style: const TextStyle(
                          color: Color(0xff4a4a4a),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0),
                    ),
                  ),
                  icon: const Center(
                      child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 40.0,
                  )),
                  width: w * 0.9,
                  radius: 20,
                  height: 60,
                  buttonColor: AppColors.secondaryColor,
                  backgroundColor: AppColors.gradientLightBlueColor,
                  highlightedColor: Colors.white,
                  baseColor: AppColors.secondaryColor,
                  dismissible: false,
                )),
          ))
        ]),
      ),
    );
  }
}
