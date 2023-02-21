import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mwardi/app/common/app_colors.dart';
import 'package:mwardi/app/common/app_text_styles.dart';
import '../../home/views/components/custom_drawer.dart';
 import '../../requests_screen/componants/custom_paint.dart';
import '../componants/calender.dart';

class AttendanceScreen extends GetView {

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),

        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xff2b374f),
          leading: IconButton(
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              painter: HeaderCurvedContainer(),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
           Column(
                children: [
                  Calendar(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Attendance History',
                          style: AppTextStyles.defaultTextStyle,
                        ),
                        Spacer(),
                        Text(
                          'show analytics',
                          style: TextStyle(
                              fontSize: 15, color: AppColors.secondaryColor),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: Get.width / 1.1,
                    child: Image.asset('assets/images/nodata.png',fit: BoxFit.contain,),
                  )
                ],
              ),

          ],
        ));
  }
}
