import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payroll_controller.dart';


class PayrollScreenView extends GetView<PayrollScreenController> {
  const PayrollScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PayrollScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PayrollScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
