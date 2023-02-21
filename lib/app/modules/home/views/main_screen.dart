import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mwardi/app/modules/home/controllers/home_controller.dart';

class MainScreen extends GetView<HomeController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.drawerScreens[controller.drawerPage.value][2]),
    );
  }
}
