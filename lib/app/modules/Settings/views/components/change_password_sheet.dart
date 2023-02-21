import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mwardi/app/common/app_text_styles.dart';
import 'package:mwardi/app/common/components/default_btn.dart';
import 'package:mwardi/app/modules/settings/controllers/settings_controller.dart';
import 'custom_text_field.dart';

class ChangePasswordSheet extends StatelessWidget {
  ChangePasswordSheet({super.key});

  final SettingsController controller = Get.find<SettingsController>();

  final TextEditingController oldPassController =
      TextEditingController(text: "");
  final TextEditingController newPassController =
      TextEditingController(text: "");
  final TextEditingController passConfirmController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Change password",
                  style: AppTextStyles.blackTextStyle
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 16.0),
                ),
                IconButton(
                    onPressed: () => Get.back(), icon: const Icon(Icons.close))
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: Get.width / 1.1,
                child: CustomTextField(
                  controller: oldPassController,
                  obSecure: true,
                  label: "old password".tr,
                  hint: "**********",
                  onChange: (v) {},
                )),
            Divider(),
            SizedBox(
                width: Get.width / 1.1,
                child: CustomTextField(
                  controller: newPassController,
                  obSecure: true,
                  label: "new password".tr,
                  hint: "**********",
                  onChange: (v) {},
                )),
            const SizedBox(width: 20),
            SizedBox(
                width: Get.width / 1.1,
                child: CustomTextField(
                  controller: passConfirmController,
                  obSecure: true,
                  label: "Password confirmation".tr,
                  hint: "**********",
                  onChange: (v) {},
                )),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Obx(() => DefaultBtn(
                  title: 'update'.tr,
                  onTap: () => controller.changePassword(
                      oldPass: oldPassController.text,
                      newPass: newPassController.text,
                      passwordConfirm: passConfirmController.text),
                  loading: controller.passwordLoading.value)),
            ),
          ],
        ),
      ),
    );
  }
}
