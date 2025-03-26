import 'package:drutoloan_todo_task/themes/app_colors.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final EasyDatePickerController datePickerController =
      EasyDatePickerController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: EasyTheme(
        data: EasyTheme.of(context).copyWithState(
          selectedDayTheme: DayThemeData(backgroundColor: AppColors.goldYellow),
          unselectedDayTheme: DayThemeData(
            backgroundColor: AppColors.greyYellow,
          ),
          disabledCurrentDayTheme: DayThemeData(
            backgroundColor: AppColors.greyYellow,
          ),
        ),
        child: EasyDateTimeLinePicker(
          firstDate: DateTime.now(),
          lastDate: DateTime(2025, 3, 29),
          focusedDate: _selectedDate,
          controller: datePickerController,
          onDateChange: (date) {
            print(date);
            _selectedDate = date;
            setState(() {});
          },
        ),
      ),
    );
  }

  @override
  dispose() {
    datePickerController.dispose();
    super.dispose();
  }
}
