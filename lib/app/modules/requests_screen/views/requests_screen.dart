import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mwardi/app/common/app_colors.dart';
import 'package:mwardi/app/common/app_text_styles.dart';
import 'package:mwardi/app/common/constants/app_constants.dart';
import '../../../common/components/button.dart';
import '../../home/views/components/custom_drawer.dart';
import '../componants/container_switch_body.dart';
import '../componants/custom_drop_down.dart';
import '../componants/custom_paint.dart';
import '../componants/custom_switch_button.dart';
import '../componants/custom_text_field.dart';
import '../controllers/request_controller.dart';

class RequestsScreen extends GetView {
  RequestController requestController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.appBarColor,
          leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu, color: Colors.white,),
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              painter: HeaderCurvedContainer(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedBoxH,
                      sizedBoxH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomSwitchButton(
                            requestController: requestController,
                            onTap: () {
                              requestController.clicked.value = false;
                            },
                            text: 'new_request'.tr,
                            isClickedButton: requestController.clicked.value,
                            isRightButton: true
                          ),
                          CustomSwitchButton(
                            requestController: requestController,
                            onTap: () {
                              requestController.clicked.value = true;
                            },
                            text: 'request_history'.tr,
                            isClickedButton: !requestController.clicked.value,
                            isRightButton: false,
                          ),
                        ],
                      ),
                      sizedBoxH,
                      requestController.clicked.value == true
                          ? ContainerSwitchBody(
                              widget: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('no_data_found'.tr),
                                  Image.asset(
                                    'assets/images/nodata.png',
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                            )
                          :  GetBuilder<RequestController>(
                          init: RequestController(), builder: (requestController) =>  ContainerSwitchBody(
                              widget: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    sizedBoxH,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.wysiwyg_rounded,
                                          color: AppColors.secondaryColor,
                                        ),
                                        Text('create_a_holiday_request'.tr,
                                            style: TextStyle(
                                                color: AppColors.secondaryColor)),
                                      ],
                                    ),
                                    sizedBoxH,
                                    Text(
                                      'holiday_type'.tr,
                                        style: AppTextStyles.requestTextField
                                    ),
                                   CustomDropDown(
                                              requestController:
                                                  requestController,
                                     value:requestController.selectedHoliday,
                                     hint: 'select_holiday_type'.tr,
                                              onChanged: (String ?v) {
                                                requestController.selectHolidayFromDropDown(v);
                                              },
                                            ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ...List.generate( 2,
                                          (index) => Obx(
                                            () => Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  index == 0
                                                      ? Text(
                                                          'start_day'.tr,   style: AppTextStyles.requestTextField
                                                        )
                                                      : Text(
                                                          'end_day'.tr,   style: AppTextStyles.requestTextField
                                                        ),
                                                  Container(
                                                    height: 60,
                                                    width: Get.width/2,
                                                    padding: EdgeInsets.all(2),
                                                    margin: const EdgeInsets.only(right: 10, top: 5),
                                                    decoration: AppTextStyles
                                                        .boxDecoration,
                                                    child: index == 0
                                                        ? ElevatedButton(
                                                            onPressed: () async {
                                                              final date = await requestController.showCalender(context: context,
                                                                dateTimee: requestController.dateTime.value,);if (date == null) return;
                                                              requestController.newTime.value = date;
                                                              print(requestController.dateTime.value);
                                                            },
                                                            style:   ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(Colors.white),
                                                            ),
                                                            child: requestController.newTime.value == null
                                                                ? Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      index == 0
                                                                          ? Text(
                                                                              'start_day'.tr,   style: AppTextStyles.requestTextField
                                                                            )
                                                                          : Text(
                                                                              'end_day'.tr,   style: AppTextStyles.requestTextField
                                                                            ),
                                                                      Image.asset(
                                                                        'assets/images/calendar_icon.png',
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        height:
                                                                            20,
                                                                        color: AppColors
                                                                            .greyColor,
                                                                      ),
                                                                    ],
                                                                  )
                                                                : Text(
                                                                    "${requestController.newTime.value?.year}/${requestController.newTime.value?.month}/${requestController.newTime.value?.day}",
                                                                    style: TextStyle(
                                                                        color: AppColors
                                                                            .greyColor),
                                                                  ),
                                                          )
                                                        : ElevatedButton(
                                                      onPressed: () async {
                                                              final date =
                                                                  await requestController
                                                                      .showCalender(
                                                                context: context,
                                                                dateTimee:
                                                                    requestController
                                                                        .dateTime1
                                                                        .value,
                                                              );
                                                              if (date == null)
                                                                return;
                                                              requestController
                                                                  .newTime1
                                                                  .value = date;
                                                              print(
                                                                  requestController
                                                                      .dateTime1
                                                                      .value);
                                                            },
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      AppColors
                                                                          .whiteColor),
                                                            ),
                                                            child: requestController.newTime1.value ==   null
                                                                ? Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'end_day'.tr,
                                                                        style: TextStyle(
                                                                            color:
                                                                                AppColors.greyColor),
                                                                      ),
                                                                      Image.asset(
                                                                          'assets/images/calendar_icon.png',
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          height:
                                                                              20,
                                                                          color: AppColors
                                                                              .greyColor),
                                                                    ],
                                                                  )
                                                                : Text(
                                                                    "${requestController.newTime1.value?.year}/${requestController.newTime1.value?.month}/${requestController.newTime1.value?.day}",
                                                                    style: TextStyle(
                                                                        color: AppColors
                                                                            .greyColor),
                                                                  ),
                                                          ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'replacement'.tr,
                                      style: AppTextStyles.requestTextField
                                    ),
                                   CustomDropDown(
                                          requestController:requestController,
                                          value:requestController.selectedReplacement,
                                          hint: 'replacement_employee'.tr,
                                          onChanged: (String ?v) {
                                            requestController.selectReplacementFromDropDown(v);
                                          },

                                    ),
                                    sizedBoxH,
                                    Text(
                                      'Reason',
                                      style: AppTextStyles.requestTextField
                                    ),
                                    CustomTextField2(requestController: requestController),
                                    sizedBoxH,
                                    Button(text: 'request_a_leave'.tr, size: Get.width,isLoggin:true)
                                  ],
                                ),
                              ),
                            )))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}


