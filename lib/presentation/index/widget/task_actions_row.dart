import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/controller/task_controller.dart';
//widget
import 'category_items.dart';
import 'send_task_button.dart';
import 'task_priority.dart';
import 'time_of_task.dart';

class TaskActionsRow extends StatefulWidget {
  const TaskActionsRow({super.key});

  @override
  State<TaskActionsRow> createState() => _TaskActionsRowState();
}

class _TaskActionsRowState extends State<TaskActionsRow> {
  final TaskController taskController = Get.find();
  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();
  int? taskPriority;

  void onDateTimeSelected(DateTime date, TimeOfDay time) {
    setState(() {
      selectedDate = date;
      selectedTime = time;
    });
  }

  void onPrioritySelected(int priority) {
    setState(() {
      taskPriority = priority;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          TimeOfTask(
            onDateTimeSelected: onDateTimeSelected,
          ),
         const CategoryItems(),
          TaskPriority(
            prioritySelected:onPrioritySelected ,
          ),
        const  Spacer(
            flex: 1,
          ),
          SendTaskButton(
           onPressed: () {
            
           },
          ),
        ],
      ),
    );
  }
}
