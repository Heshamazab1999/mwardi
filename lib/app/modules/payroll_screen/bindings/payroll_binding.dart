import 'package:get/get.dart';

import '../controllers/payroll_controller.dart';


class PayrollScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayrollScreenController>(
      () => PayrollScreenController(),
    );
  }
}
