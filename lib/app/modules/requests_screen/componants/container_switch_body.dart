

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContainerSwitchBody extends StatelessWidget {
  ContainerSwitchBody({
    required this.widget,
    Key? key,
  }) : super(key: key);
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
          width: Get.width,
          margin: const EdgeInsets.only(
            left: 7,
            right: 7,
          ),
          color: Color(0xFFb1aab2).withOpacity(.3),
          // color: Colors.grey.shade300,
          child: widget),
    );
  }
}
