


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../common/app_colors.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    Key? key,
  }) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  PageController pageController = PageController();

  DateTime focusedDay = DateTime.now();
  DateTime focused=DateTime.now();
  DateTime _selectedDay=DateTime.now();
  @override
  Widget build(BuildContext context) {
    String headerText = DateFormat.MMMM().format(focusedDay);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Card(
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height /2.5,
          margin: EdgeInsets.all(11),
           color: Colors.white,
          child: TableCalendar(
            calendarStyle: const CalendarStyle(
                todayTextStyle: TextStyle(fontSize: 15),
                weekendTextStyle: TextStyle(fontSize: 15),
                outsideTextStyle: TextStyle(fontSize: 15),
                defaultTextStyle: TextStyle(fontSize: 15)),
            headerStyle: HeaderStyle(
                titleCentered: true,
                titleTextFormatter: (date, locale) =>
                    DateFormat.MMMM(locale).format(date),
                formatButtonVisible: false,
                leftChevronIcon: Icon(Icons.arrow_back_ios,color: AppColors.secondaryColor),
                rightChevronIcon: Icon(Icons.arrow_forward_ios,color: AppColors.secondaryColor),
                titleTextStyle: TextStyle(fontSize: 15)),
            shouldFillViewport: true,
            rowHeight: MediaQuery.of(context).size.height * 0.02,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),

            focusedDay: _selectedDay,
            selectedDayPredicate: (day) =>isSameDay(day, _selectedDay),

            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  focused = focusedDay;
                  _selectedDay = focusedDay;
                  print(focused);
                  print(selectedDay);

                });
              }
            },
          )
        )

      ),
    );
  }
}