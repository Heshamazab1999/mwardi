import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mwardi/app/common/app_translations.dart';
import 'package:mwardi/app/common/constants/app_constants.dart';
import 'package:mwardi/initial_binding.dart';
import 'package:mwardi/pre_initial_binding.dart';
import './app/common/app_theme.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  PreInitialBindings.preInitializeServices();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mawardi",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.appTheme,
      translations: AppTranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: supportedLocales['en'],
      initialBinding: InitialBinding(),
    ),
  );
}
