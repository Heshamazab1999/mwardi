import 'package:flutter/material.dart';
import 'package:mwardi/app/common/app_colors.dart';
import 'package:mwardi/app/common/app_text_styles.dart';

class DefaultBtn extends StatelessWidget {
  const DefaultBtn({
    Key? key,
    required this.title,
    required this.onTap,
    required this.loading,
    this.color,
    this.textColor,
    this.decoration,
    this.isActive = true,
  }) : super(key: key);

  final String title;
  final Function onTap;
  final Color? color;
  final Color? textColor;
  final BoxDecoration? decoration;
  final bool loading;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => !isActive || loading ? null : onTap(),
      child: Container(
        decoration: decoration ??
            BoxDecoration(
                color: !isActive
                    ? AppColors.greyColor
                    : color ?? AppColors.secondaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(12))),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Center(
            child: loading
                ? const CircularProgressIndicator.adaptive()
                : Text(
                    title,
                    style: AppTextStyles.btnTextStyle,
                  )),
      ),
    );
  }
}
