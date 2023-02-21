import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mwardi/app/common/app_colors.dart';
import 'package:mwardi/app/common/app_text_styles.dart';
import 'package:mwardi/app/common/components/default_btn.dart';
import 'package:mwardi/app/modules/settings/controllers/settings_controller.dart';
import 'custom_text_field.dart';

class ChangePicSheet extends StatelessWidget {
  ChangePicSheet({super.key});

  final SettingsController controller = Get.find<SettingsController>();

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
                  "Chose profile pic",
                  style: AppTextStyles.blackTextStyle
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 16.0),
                ),
                IconButton(
                    onPressed: () => Get.back(), icon: const Icon(Icons.close))
              ],
            ),
            const SizedBox(height: 20),
            Obx(() => controller.photo.value != null &&
                    controller.photo.value!.path.isNotEmpty
                ? CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        FileImage(File(controller.photo.value!.path)),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton.small(
                          child: const Icon(Icons.delete_outline_outlined),
                          onPressed: () => controller.photo.value = XFile("")),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                          onPressed: () =>
                              controller.pickImage(fromGallery: true),
                          icon: Icon(
                            Icons.photo_library_outlined,
                            color: AppColors.greyColor,
                          ),
                          label: Text(
                            'From Gallery',
                            style: AppTextStyles.defaultTextStyle,
                          )),
                      ElevatedButton.icon(
                          onPressed: () =>
                              controller.pickImage(fromGallery: false),
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: AppColors.greyColor,
                          ),
                          label: Text(
                            'From Camera',
                            style: AppTextStyles.defaultTextStyle,
                          ))
                    ],
                  )),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Obx(() => DefaultBtn(
                  title: 'update'.tr,
                  isActive: controller.photo.value != null &&
                      controller.photo.value!.path.isNotEmpty,
                  onTap: () => controller.changeProfilePic(),
                  loading: controller.picLoading.value)),
            ),
          ],
        ),
      ),
    );
  }
}
