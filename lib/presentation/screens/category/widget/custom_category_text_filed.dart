import 'package:flutter/material.dart';
import 'package:todo_app/constant/color_manger.dart';
import 'package:todo_app/constant/string_manger.dart';

class CustomCategoryTextFiled extends StatelessWidget {
  const CustomCategoryTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'field cannot be empty';
        }
        return null;
      },
      cursorColor: ColorManger.KWhiteColor,
      style: const TextStyle(color: ColorManger.KWhiteColor),
      decoration: const InputDecoration(
        hintText: StringManger.kCategoryname,
        hintStyle: TextStyle(color: Color(0xffAFAFAF), fontSize: 18),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff979797))),
        enabledBorder: InputBorder.none,
      ),
    );
  }
}
