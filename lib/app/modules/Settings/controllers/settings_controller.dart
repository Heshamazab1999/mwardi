import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mwardi/app/data/managers/api_manager/auth.manager.dart';
import 'package:mwardi/app/data/managers/cache_manager/cache_manager.dart';
import 'package:mwardi/app/data/services/logger/logger.dart';
import 'package:mwardi/app/modules/Settings/views/components/change_pic_sheet.dart';
import 'package:mwardi/app/modules/home/controllers/home_controller.dart';
import 'package:mwardi/app/modules/settings/views/components/change_password_sheet.dart';
import 'package:mwardi/app/modules/settings/views/components/locale_dialog.dart';
import 'package:mwardi/app/modules/settings/views/components/notification_dialog.dart';
import 'package:mwardi/app/util/action_center/action_center.dart';
import 'package:mwardi/app/util/ui/overlay_helper.dart';
import 'package:mwardi/app/data/models/login_response/data.dart' as EMPLOYEE;

class SettingsController extends GetxController {
  RxBool notificationEnabled = true.obs;
  RxString locale = 'en'.obs;

  final AuthManager _authManager = AuthManager(Get.find());
  final ActionCenter _actionCenter = ActionCenter(Get.find<AbsLogger>());

  showLocaleDialog() {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) => const LocaleDialog());
  }

  showNotificationDialog() {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) => const NotificationDialog());
  }

  changeLocaleSettings() {
    // DO call backend to save setting
    Get.back();
  }

  changeNotificationSettings() {
    // DO call backend to save setting
    Get.back();
  }

  showNewPasswordSheet() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ChangePasswordSheet()),
    );
  }

  showUpdatePicSheet() {
    photo.value = XFile("");
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ChangePicSheet()),
    );
  }

  RxBool passwordLoading = false.obs;
  changePassword(
      {required String oldPass,
      required String newPass,
      required String passwordConfirm}) async {
    if (oldPass.isEmpty || newPass.isEmpty || passwordConfirm.isEmpty) {
      return;
    }
    passwordLoading.value = true;
    await _actionCenter.execute(() async {});
    var result = (await _actionCenter.execute(
      () async {
        await _authManager.updatePassword(
            oldPass: oldPass, newPass: newPass, confirmedPAss: passwordConfirm);
      },
      checkConnection: true,
    ));
    passwordLoading.value = false;
    if (result) {
      Get.back();
      OverlayHelper.showSuccessToast(
          Get.overlayContext!, "Password changed successfully!");
    }
  }

  final Rx<XFile?> photo = XFile("").obs;
  pickImage({required bool fromGallery}) async {
    final ImagePicker picker = ImagePicker();

    if (fromGallery) {
      photo.value = await picker.pickImage(source: ImageSource.gallery);
    } else {
      photo.value = await picker.pickImage(source: ImageSource.camera);
    }
  }

  RxBool picLoading = false.obs;
  changeProfilePic() async {
    if (photo.value == null || photo.value!.path.isEmpty) {
      return;
    }
    picLoading.value = true;
    EMPLOYEE.Data? respondedUserData;
    await _actionCenter.execute(() async {});
    var result = (await _actionCenter.execute(
      () async {
        respondedUserData = await _authManager.updateProfilePic(
            newProfilePic: File(photo.value!.path));
      },
      checkConnection: true,
    ));
    picLoading.value = false;
    if (result && respondedUserData != null) {
      EMPLOYEE.Data? currentUserData = Get.find<ICacheManager>().getUserData();
      Get.find<ICacheManager>().setProfileData(
          currentUserData!.copyWith(employee: respondedUserData!.employee));
      Get.find<HomeController>().getUserData();
      Get.back();
      OverlayHelper.showSuccessToast(
          Get.overlayContext!, "Profile pic changed successfully!");
    }
  }
}
