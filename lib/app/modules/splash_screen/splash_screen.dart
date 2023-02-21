
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mwardi/app/common/app_colors.dart';
import '../home/controllers/home_controller.dart';
import '../home/views/home_view.dart';
import 'controllers/splash_controller.dart';



class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);

    final controller=Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            SizedBox(height: 50),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 100,
              child: RotatedBox(
                quarterTurns: 2,
                child: LinearProgressIndicator(
                  minHeight: 2,
                  color: AppColors.secondaryColor,
                  backgroundColor: AppColors.secondaryColor.withOpacity(0.5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}

