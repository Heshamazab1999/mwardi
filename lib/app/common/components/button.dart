


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mwardi/app/common/app_colors.dart';

class Button extends StatelessWidget {
  final String text;
  final double size;
  final bool ? isLoggin;
  final VoidCallback ?onPressed;

  const Button({
    required this.text,
    required this.size,
    this.onPressed,
    this.isLoggin,
    Key? key,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Ink(
          child: Container(
            width: size,
            height: 50,
            margin:  EdgeInsets.symmetric
              (horizontal: 27.0 ,vertical: 2.0) ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            color:AppColors.secondaryColor,
            ),
            alignment: Alignment.center,
            child:   Text(
              text,
              textAlign: TextAlign.center,
              style:   TextStyle(fontSize: 18,
                fontWeight: FontWeight.bold,
                color:isLoggin==true?AppColors.whiteColor:Colors.cyan,
              ),
            ),
          ),


    );
  }
}