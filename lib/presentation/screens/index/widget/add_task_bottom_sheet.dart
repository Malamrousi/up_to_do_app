import 'package:flutter/material.dart';
//constant
import 'package:todo_app/constant/color_manger.dart';
import 'package:todo_app/constant/string_manger.dart';

import 'add_task_text_filed.dart';
import 'task_actions_row.dart';

//widget

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: Column(
                children: [
                  Text(
                    StringManger.kAddtasks,
                    style: TextStyle(
                        color: ColorManger.KWhiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AddTaskTextFiled(
                    autofocus: true,
                    hintText: 'Tittle',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AddTaskTextFiled(
                    autofocus: false,
                    hintText: 'Description',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
           TaskActionsRow()
          ],
        ),
      ),
    );
  }
}
