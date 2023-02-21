



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/app_text_styles.dart';
import '../controllers/request_controller.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    Key? key,
    required this.requestController,
    required this.hint,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  final RequestController requestController;
  String ?value;
  Function(String?)? onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: AppTextStyles.boxDecoration,
      child: DropdownButton(
          isExpanded: true,
          underline: SizedBox(),
          hint: Text(hint,   style: AppTextStyles.requestTextField),

          //selectedName
          value: value,
          items: requestController.lista.map((name) {
            return DropdownMenuItem(
              child: Text(name),
              value: name,
            );
          }).toList(),
          onChanged: onChanged!),
    );
  }
}
