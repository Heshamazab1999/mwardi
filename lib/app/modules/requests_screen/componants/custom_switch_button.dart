

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/app_colors.dart';
import '../controllers/request_controller.dart';

class CustomSwitchButton extends StatelessWidget {
  CustomSwitchButton({
    Key? key,
    required this.requestController,
    required this.onTap,
    required this.text,
    required this.isRightButton,
    required this.isClickedButton,
  }) : super(key: key);
  Function()? onTap;
  String text;
  bool isRightButton;
  bool isClickedButton;
  RequestController requestController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            height: 50,
            width:   Get.width/2.3,
            decoration:   BoxDecoration(
              color: isClickedButton?AppColors.secondaryColor:AppColors.whiteColor,
              shape: BoxShape.rectangle,
              borderRadius: isRightButton ?const BorderRadius.only(
                bottomRight: Radius.circular(10.0),
                topLeft:  Radius.circular(25.0),):
              BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                topRight:  Radius.circular(25.0),
              ),
            ),
            child:Center(child: Text(text,style: TextStyle(color: isClickedButton?AppColors.whiteColor:AppColors.secondaryColor,)) ,
            )
        )
    );
  }
}
