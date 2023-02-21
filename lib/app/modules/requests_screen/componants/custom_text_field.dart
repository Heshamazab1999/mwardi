


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../controllers/request_controller.dart';

class CustomTextField2 extends StatelessWidget {
  const CustomTextField2({
    Key? key,
    required this.requestController,
  }) : super(key: key);

  final RequestController requestController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:
      requestController.reasonController,
      decoration: InputDecoration(
        // filled: true,
        // fillColor: AppColors.whiteColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.greyColor
                .withOpacity(.8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 3,
            color: AppColors.greyColor
                .withOpacity(.8),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              width: 3,
              color: Color.fromARGB(
                  255, 66, 125, 145)),
        ),
      ),
    );
  }
}
