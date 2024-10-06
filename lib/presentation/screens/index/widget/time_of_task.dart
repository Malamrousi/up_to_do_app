import 'package:flutter/material.dart';
import 'package:todo_app/constant/color_manger.dart';

class TimeOfTask extends StatefulWidget {
  const TimeOfTask({super.key});

  @override
  State<TimeOfTask> createState() => _TimeOfTaskState();
}

class _TimeOfTaskState extends State<TimeOfTask> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      barrierColor: ColorManger.KPrimaryColor,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2100),
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            dialogBackgroundColor: Color(0xff363636),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    } else {
      setState(() {
        selectedDate = DateTime.now();
      });
    }

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      barrierColor: ColorManger.KPrimaryColor,
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            dialogBackgroundColor: Color(0xff363636),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    } else {
      setState(() {
        selectedTime = TimeOfDay.now();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          selectDateTime(context);
        },
        icon: const Icon(
          Icons.timer_outlined,
          size: 24,
          color: ColorManger.KWhiteColor,
        ));
  }
}
