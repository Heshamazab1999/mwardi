import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle defaultTextStyle = TextStyle(
    color: AppColors.textColor,
  );

  static get blackTextStyle => TextStyle(
      color: AppColors.blackColor, fontSize: 14.0, fontWeight: FontWeight.w600);

  static get greenTextStyle => TextStyle(
      color: AppColors.greenColor, fontSize: 14.0, fontWeight: FontWeight.w400);

  static get greyTextStyle => TextStyle(
      color: AppColors.greyColor, fontSize: 13.0, fontWeight: FontWeight.w400);

  static get btnTextStyle => TextStyle(
      color: AppColors.whiteColor, fontSize: 17.0, fontWeight: FontWeight.w600);


  static TextStyle requestTextField = TextStyle(
      fontSize: 12, color: AppColors.blackColor.withOpacity(.5), height: 2);


  static BoxDecoration boxDecoration=BoxDecoration(
    border: Border.all(color: AppColors.greyColor.withOpacity(.4),width: 2),
    borderRadius: BorderRadius.circular(10),
  );
}
