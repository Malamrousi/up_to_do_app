import 'package:flutter/material.dart';
// constant
import 'package:todo_app/constant/color_manger.dart';
import 'package:todo_app/constant/string_manger.dart';
import 'package:todo_app/presentation/screens/category/widget/custom_Icon_picker.dart';
import 'package:todo_app/presentation/screens/category/widget/custom_category_color.dart';
import 'package:todo_app/presentation/screens/category/widget/custom_button.dart';
import '../widget/custom_category_text_filed.dart';

class CategoryScreens extends StatefulWidget {
  const CategoryScreens({super.key});

  @override
  _CategoryScreensState createState() => _CategoryScreensState();
}

class _CategoryScreensState extends State<CategoryScreens> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringManger.kCreatenewcategory,
                style: TextStyle(
                    color: ColorManger.KWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                StringManger.kCategoryname,
                style: TextStyle(
                  color: ColorManger.KWhiteColor,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomCategoryTextFiled(),
              SizedBox(
                height: 20,
              ),
              Text(
                StringManger.kCategoryicon,
                style: TextStyle(
                  color: ColorManger.KWhiteColor,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              IconPicker(),
              SizedBox(
                height: 20,
              ),
              CustomCategoryColor(),
              Spacer(),
              Row(
                children: [
                  CustomButton(
                    title: 'Cancel',
                    TextColor: ColorManger.KHeliotrop,
                  ),
                  CustomButton(
                    title: 'Create Category',
                    TextColor: ColorManger.KWhiteColor,
                    color: ColorManger.KHeliotrop,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
