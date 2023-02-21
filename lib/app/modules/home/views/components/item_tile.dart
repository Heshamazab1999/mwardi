import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/app_text_styles.dart';

class ItemTile extends StatelessWidget {
  String name;
  Widget icon;
  var index;
  bool selected;
  Function()?onTap;
  bool isLogout = false;
  ItemTile({
    Key? key,
    required this.onTap,
    required this.isLogout,
    required this.name,
    required this.index,
    required this.icon,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => onTab,
      onTap:onTap,
      child: Row(children: [
        icon,
        const SizedBox(width: 20),
        Text(
          name,
          style: AppTextStyles.greyTextStyle.copyWith(
            fontSize: 17.0,
            fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
            color: isLogout
                ? AppColors.redColor
                : selected
                ? AppColors.textColor
                : null,
          ),
        ),
        const Spacer(),
        if (!isLogout)
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.greyColor,
            size: 16,
          ),
        const SizedBox(width: 15),
      ]),
    );
  }
}
