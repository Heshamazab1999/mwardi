import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/app_text_styles.dart';
import '../../common/components/default_btn.dart';
import '../../common/constants/app_constants.dart';
import '../Settings/views/components/custom_text_field.dart';
import '../login_screen/controller/login_controller.dart';

class RechangeScreen extends StatelessWidget {

  static final LoginController _loginController = Get.find<LoginController>();
final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: () {
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios),),),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              sizedBoxH,
              Text(
                'Change Password',
                style: AppTextStyles.blackTextStyle.copyWith(
                  fontSize: 20.0,
                ),
              ),
              sizedBoxH,
              SizedBox(
                width: Get.width / 1.1,
                child: CustomTextField(
                  prefixIcon: Icons.email,
                  label: "new password".tr,
                  hint: "new password",
                  type: TextInputType.visiblePassword,
                  onChange: (v) {
                    _loginController.rechangePass = v;
                  },                validator: (v){},

                ),
              ),
              SizedBox(
                width: Get.width / 1.1,
                child: CustomTextField(
                  prefixIcon: Icons.email,
                  label: "confirm password".tr,
                  hint: "confirm password",
                  type: TextInputType.visiblePassword,
                  validator: (validator) {
                    if (validator!.isEmpty) return 'Empty';
                    if (validator != _loginController.rechangePass) {
                      return 'The passwords do not match';
                    }
                    return null;
                  },
                  onChange: (v) {
                    _loginController.confirmPassword = v;
                  },
                ),
              ),
              sizedBoxH,
              sizedBoxH,

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Obx(() => DefaultBtn(
                    title: 'Send Otp'.tr,
                    onTap: () {
                      if(formKey.currentState!.validate() )
                          _loginController.rechangePassword();

                    },
                    loading: _loginController.loading.value)),
              ),
              Spacer(),
            ]),)
      ),

    );
  }
}
