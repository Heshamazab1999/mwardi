import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mwardi/app/modules/login_screen/controller/login_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mwardi/app/common/components/default_btn.dart';
import '../../common/app_text_styles.dart';
import '../../common/constants/app_constants.dart';
import '../Settings/views/components/custom_text_field.dart';


class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  static final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding:   EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:CrossAxisAlignment.start,children: [
            const Spacer(),
            Text(
              'Verify the OTP ',
              style: AppTextStyles.blackTextStyle.copyWith(
                fontSize: 20.0,
              ),
            ),
            sizedBoxH,
           SizedBox(width: Get.width/1.5,child:  Text(
             'Please add the received code',
             style: AppTextStyles.greyTextStyle
                 .copyWith(fontSize: 12.0, color: Colors.black26.withAlpha(120)),
           ),),
            sizedBoxH,
            SizedBox(
              width: Get.width / 1.1,
              child: CustomTextField(
                prefixIcon: Icons.app_settings_alt_outlined,
                label: "code".tr,
                hint: "*****",
                type: TextInputType.number,
                onChange: (v) {
                  _loginController.otp = v;
                },
                validator: (v){},

              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Obx(() => DefaultBtn(
                  title: 'Verify Otp'.tr,
                  onTap: () => _loginController.verifOtpy(),
                  loading: _loginController.loading.value)),
            ),
            Spacer(),
          ]),
      ),

    );
  }
}
