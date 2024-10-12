import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/color_manger.dart';

class AddTaskTextFiled extends StatelessWidget {
  const AddTaskTextFiled(
      {super.key, required this.hintText, required this.autofocus});

  final String hintText;

  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'field cannot be empty';
        }
        return null;
      },
      cursorColor: ColorManger.kWhiteColor,
      style: const TextStyle(color: ColorManger.kWhiteColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xffAFAFAF), fontSize: 18),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff979797))),
        enabledBorder: InputBorder.none,
      ),
    );
  }
}
