import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mwardi/app/common/app_colors.dart';

class CustomTextField extends StatelessWidget {
    CustomTextField(
      {Key? key,
      this.hint,
      this.icon,
      this.label,
      this.onChange,
      this.controller,
      this.obSecure = false,
      this.prefixIcon,
      this.validator,
      this.type})
      : super(key: key);
  final Function(String)? onChange;
  final String? label;
  final String? hint;
  final IconButton? icon;
  final TextInputType? type;
  final bool? obSecure;
  final IconData? prefixIcon;
  String ?Function(String? )? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        onChanged: onChange,
        obscureText: obSecure!,
        validator: validator!,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            suffixIcon: icon,
            labelText: label!,
            labelStyle: TextStyle(color: AppColors.greyColor, fontSize: 18),
            hintStyle: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
            hintText: hint!,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondaryColor),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
