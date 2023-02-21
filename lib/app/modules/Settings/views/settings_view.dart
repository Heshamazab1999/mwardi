import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mwardi/app/common/app_colors.dart';
import 'package:mwardi/app/common/app_text_styles.dart';
import 'package:mwardi/app/common/constants/app_constants.dart';
import 'package:mwardi/app/common/extensions.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
          padding: defaultPadding,
          child: Column(
            children: [
              (h * 0.05).vSpace(),
              settingsTile(
                  title: "Change profile pic",
                  onTap: controller.showUpdatePicSheet),
              settingsTile(
                  title: "Change password",
                  onTap: controller.showNewPasswordSheet),
              (20.0).vSpace(),
              settingsTile(
                  title: "Language",
                  trailing: Obx(() => Text(
                        controller.locale.value == 'en' ? "English" : "Arabic",
                        style: AppTextStyles.blackTextStyle
                            .copyWith(fontWeight: FontWeight.w300),
                      )),
                  onTap: controller.showLocaleDialog),
              settingsTile(
                  title: "Notifications",
                  trailing: Obx(() => Text(
                        controller.notificationEnabled.value ? "On" : "Off",
                        style: AppTextStyles.blackTextStyle
                            .copyWith(fontWeight: FontWeight.w300),
                      )),
                  onTap: controller.showNotificationDialog),
            ],
          )),
    );
  }

  Widget settingsTile(
      {required String title, required Function onTap, Widget? trailing}) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.all(15),
        color: AppColors.whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextStyles.blackTextStyle
                  .copyWith(fontWeight: FontWeight.w300),
            ),
            Row(
              children: [
                if (trailing != null)
                  Row(
                    children: [trailing, 5.0.hSpace()],
                  ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
