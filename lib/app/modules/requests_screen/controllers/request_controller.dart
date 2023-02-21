



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mwardi/app/common/app_colors.dart';

class RequestController extends GetxController{

final clicked=false.obs;

Rx<DateTime> dateTime = DateTime.now().obs;
 Rxn<DateTime> newTime = Rxn<DateTime>();
Rx<TimeOfDay> time = TimeOfDay.now().obs;
Rx<DateTime> dateTime1 = DateTime.now().obs;
 Rxn<DateTime> newTime1 = Rxn<DateTime>();
Rx<TimeOfDay> time1 = TimeOfDay.now().obs;
Rxn<TimeOfDay> newTimeByHours = Rxn<TimeOfDay>();
final reasonController=TextEditingController();
String ?selectedHoliday;
String ?selectedReplacement;
List <String>lista=['Data1','Data2','Data3','Data4'];


selectHolidayFromDropDown(value){
  selectedHoliday =value;
  update();
}
selectReplacementFromDropDown(value){
  selectedReplacement =value;
  update();
}


Future<DateTime?> showCalender({required BuildContext context,required dateTimee}) async =>
    await showDatePicker(
        context: context,
        lastDate: DateTime(2100),
        firstDate: DateTime(2000),
        initialDate: dateTimee,
        // initialDate: dateTime.value,
        builder:(BuildContext context,  Widget ?child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary:  AppColors.secondaryColor,
                onPrimary:  AppColors.whiteColor, // <-- SEE HERE
                onSurface: Color.fromARGB(255, 66, 125, 145), // <-- SEE HERE
              ),
              primaryColor:   AppColors.secondaryColor,
              accentColor: AppColors.whiteColor,
              buttonTheme: const ButtonThemeData(
                  textTheme: ButtonTextTheme.primary
              ),
            ), child: child!,
          );});

}