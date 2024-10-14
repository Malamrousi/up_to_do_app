import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/color_manger.dart';
import 'package:todo_app/core/utils/string_manger.dart';

class CustomCategoryTextFiled extends StatelessWidget {
  const CustomCategoryTextFiled({super.key, required this.categoryName});

  final TextEditingController categoryName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: categoryName,
      autofocus: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'field cannot be empty';
        }
        return null;
      },
      cursorColor: ColorManger.kWhiteColor,
      style: const TextStyle(color: ColorManger.kWhiteColor),
      decoration: const InputDecoration(
        hintText: StringManger.kCategoryName,
        hintStyle: TextStyle(color: Color(0xffAFAFAF), fontSize: 18),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff979797))),
        enabledBorder: InputBorder.none,
      ),
    );
  }
}
