import 'package:flutter/material.dart';
import 'package:mwardi/app/common/app_assets.dart';
import 'package:mwardi/app/util/ui/snack_bar_helper.dart';

class OverlayHelper {
  static final Map<int, OverlayEntry?> _lastOverlays = {};

  static const int _defaultDuration = 5;

  // TODO: refactor to use the theme colors
  static Color successColor = const Color(0xffE9F6ED);
  static Color errorColor = const Color(0xffF6E7E4);
  static Color infoColor = const Color(0xffE3ECF7);
  static Color warningColor = const Color(0xffFAF3E6);
  static Color generalColor = const Color(0xFFEEEDF2);

  static void showSuccessToast(BuildContext context, String text,
      {int seconds = 10}) {
    showSnackBar("Success", text,
        context: context,
        color: successColor,
        iconSVG: AssetImages.success,
        durationInSeconds: seconds);
  }

  static void showGeneralToast(
      BuildContext context, String title, String message,
      {int seconds = 10, VoidCallback? onTap}) {
    showSnackBar(title, message,
        context: context,
        color: generalColor,
        iconSVG: AssetImages.infoIcon,
        onTap: onTap,
        durationInSeconds: seconds);
  }

  static void showErrorToast(BuildContext context, String text,
      {int seconds = 10}) {
    showSnackBar("Error", text,
        context: context,
        color: errorColor,
        iconSVG: AssetImages.errorIcon,
        durationInSeconds: seconds);
  }

  static void showInfoToast(BuildContext context, String text,
      {int seconds = 10}) {
    showSnackBar("Information", text,
        context: context,
        color: infoColor,
        iconSVG: AssetImages.infoIcon,
        durationInSeconds: seconds);
  }

  static void showWarningToast(BuildContext context, String text,
      {int seconds = 10}) {
    showSnackBar("Warning", text,
        context: context,
        color: warningColor,
        iconSVG: AssetImages.warning,
        durationInSeconds: seconds);
  }

  // progress methods
  // layer index 1 is preserved for the progress indicator
}
