import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/color_manger.dart';

class TimeOfTask extends StatefulWidget {
  const TimeOfTask({
    super.key,
    required this.onDateTimeSelected,
  });

  final void Function(DateTime dateTime, TimeOfDay timeOfDay)
      onDateTimeSelected;

  @override
  State<TimeOfTask> createState() => _TimeOfTaskState();
}

class _TimeOfTaskState extends State<TimeOfTask> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  Future<void> selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      barrierColor: ColorManger.kPrimaryColor,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2100),
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            dialogBackgroundColor: const Color(0xff363636),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      barrierColor: ColorManger.kPrimaryColor,
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            dialogBackgroundColor: const Color(0xff363636),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
    widget.onDateTimeSelected(selectedDate!, selectedTime!);
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
          color: ColorManger.kWhiteColor,
        ));
  }
}
