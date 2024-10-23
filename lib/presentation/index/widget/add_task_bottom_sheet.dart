import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//constant
import 'package:todo_app/core/utils/color_manger.dart';
import 'package:todo_app/core/utils/string_manger.dart';
import 'package:todo_app/data/controller/task_controller.dart';
import 'package:todo_app/data/models/task_model.dart';
import 'package:todo_app/presentation/index/widget/send_task_button.dart';
import 'package:todo_app/presentation/index/widget/task_priority.dart';
import 'package:todo_app/presentation/index/widget/time_of_task.dart';

import 'add_task_text_filed.dart';
import 'category_items.dart';

//widget

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final TaskController taskController = Get.find();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  GlobalKey<FormState> fromKey = GlobalKey();

  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();
  int? taskPriority;
  Map<String, dynamic>? selectedCategory;

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

  void onCategorySelected(Map<String, dynamic> category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: fromKey,
              child: Column(
                children: [
                  const Text(
                    StringManger.kAddTasks,
                    style: TextStyle(
                        color: ColorManger.kWhiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AddTaskTextFiled(
                    controller: title,
                    autoFocus: true,
                    hintText: 'Tittle',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AddTaskTextFiled(
                    controller: description,
                    autoFocus: false,
                    hintText: 'Description',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Row(
                children: [
                  TimeOfTask(
                    onDateTimeSelected: onDateTimeSelected,
                  ),
                  CategoryItems(
                    selectedCategory: onCategorySelected,
                  ),
                  TaskPriority(
                    prioritySelected: onPrioritySelected,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  SendTaskButton(
                    onPressed: () {
                      final newTask = TaskModel(
                     
                          title: title.text,
                          description: description.text,
                          category: selectedCategory!,
                          taskPriority: taskPriority!,
                          startTime: selectedTime!,
                          date: selectedDate!);

                      if (fromKey.currentState!.validate()) {
                        taskController.addTask(newTask);
                        Get.back();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
