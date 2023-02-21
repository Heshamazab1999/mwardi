import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mwardi/app/common/app_colors.dart';
import 'package:mwardi/app/common/components/default_btn.dart';

import '../../../common/app_text_styles.dart';
import '../../../common/components/button.dart';
import '../../../common/constants/app_constants.dart';
// import '../../home/views/components/button.dart';
import '../../../routes/app_pages.dart';
import '../controller/login_controller.dart';
import 'componants/custom_text_field.dart';

class LoginPageView extends GetView {
  const LoginPageView({Key? key}) : super(key: key);
  static final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(),
          Text(
            'Login Account',
            style: AppTextStyles.blackTextStyle.copyWith(
              fontSize: 20.0,
            ),
          ),
          sizedBoxH,
          Text(
            'Stay Signed in with Yopur account',
            style: AppTextStyles.greyTextStyle
                .copyWith(fontSize: 12.0, color: Colors.black26.withAlpha(120)),
          ),
          sizedBoxH,
          SizedBox(
            width: Get.width / 1.1,
            child: CustomTextField(
              prefixIcon: Icons.email,
              label: "email".tr,
              hint: "email@test.com",
              type: TextInputType.emailAddress,
              onChange: (v) {
                _loginController.email = v;
              },
            ),
          ),
          SizedBox(
            width: Get.width / 1.1,
            child: Obx(() => CustomTextField(
                  obSecure: _loginController.obSecure,
                  label: "password".tr,
                  hint: "**********",
                  type: TextInputType.emailAddress,
                  // icon:
                  prefixIcon: Icons.lock,
                  icon: IconButton(
                    icon: Icon(
                      _loginController.obSecure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                      color: _loginController.obSecure
                          ? AppColors.greyColor
                          : AppColors.greyColor,
                    ),
                    onPressed: () {
                      _loginController.toggleObSecure();
                    },
                  ),
                  onChange: (v) {
                    _loginController.password = v;
                    print(v);
                  },
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              sizedBoxW,
              InkWell(
                child: Text(
                  'Forge Password ?',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.secondaryColor,
                  ),
                ),onTap: (){
                Get.offNamed(Routes.FORGET);
              },
              ),
            ],
          ),
          // sizedBoxH,

          Obx(
            () => Row(
              children: [
                Material(
                  child: Checkbox(
                    value: _loginController.agree.value,
                    onChanged: (value) {
                      _loginController.agreeFunc(value);
                    },
                  ),
                ),
                const Text(
                  'I have read and accept terms and conditions',
                  style: TextStyle(
                      decoration: TextDecoration.underline, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Obx(() => DefaultBtn(
                title: 'Login'.tr,
                onTap: () => _loginController.login(),
                loading: _loginController.loading.value)),
          ),
          Spacer(),
        ]),
      ),
    );
  }
}