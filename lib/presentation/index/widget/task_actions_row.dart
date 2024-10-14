import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Row(
        children: [
          TimeOfTask(),
          CategoryItems(),
          TaskPriority(),
          Spacer(
            flex: 1,
          ),
          SendTaskButton(),
        ],
      ),
    );
  }
}
