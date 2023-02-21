import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mwardi/app/common/components/default_btn.dart';

import '../../common/app_text_styles.dart';
import '../../common/constants/app_constants.dart';
import '../Settings/views/components/custom_text_field.dart';
import '../login_screen/controller/login_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);
  static final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
      leading: IconButton(onPressed: () {
        Get.back();
      }, icon: Icon(Icons.arrow_back_ios),),),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text(
              'Password reset',
              style: AppTextStyles.blackTextStyle.copyWith(
                fontSize: 20.0,
              ),
            ),
            sizedBoxH,
            SizedBox(width: Get.width/1.5,child:  Text(
              'Please enter your registered email address .An email notification with a password reset good well then be sent it to you ',
              style: AppTextStyles.greyTextStyle
                  .copyWith(fontSize: 12.0, color: Colors.black26.withAlpha(120)),
            ),),
            sizedBoxH,
            SizedBox(
              width: Get.width / 1.1,
              child: CustomTextField(
                prefixIcon: Icons.email,
                label: "email".tr,
                hint: "email@test.com",
                type: TextInputType.emailAddress,
                onChange: (v) {
                  _loginController.emailVerify = v;
                },
                validator: (v){},
              ),
            ),
                sizedBoxH,
                sizedBoxH,

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Obx(() => DefaultBtn(
                  title: 'Send Otp'.tr,
                  onTap: () => _loginController.sendOtp(),
                  loading: _loginController.loading.value)),
            ),
            Spacer(),
          ]),
      ),

    );
  }
}
