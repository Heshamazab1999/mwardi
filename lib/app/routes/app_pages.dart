import 'package:get/get.dart';
import 'package:mwardi/app/modules/forget_screen/forget_screen.dart';
import 'package:mwardi/app/modules/forget_screen/otp_screen.dart';
import 'package:mwardi/app/modules/forget_screen/rechange_screen.dart';

import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/main_screen.dart';
import '../modules/login_screen/views/login_screen.dart';
import '../modules/splash_screen/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;
  // static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const MainScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginPageView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpScreen(),
      binding: HomeBinding(),
    ), GetPage(
      name: _Paths.FORGET,
      page: () => const ForgetPasswordScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.RECHANGE,
      page: () =>  RechangeScreen(),
      binding: HomeBinding(),
    ),


    // GetPage(
    //   name: _Paths.PAYROLL_SCREEN,
    //   page: () => const PayrollScreenView(),
    //   binding: PayrollScreenBinding(),
    // ),
  ];
}
