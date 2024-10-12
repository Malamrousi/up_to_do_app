import 'package:flutter/material.dart';
// constant
import 'package:todo_app/core/utils/color_manger.dart';
import 'package:todo_app/core/utils/string_manger.dart';
import 'package:todo_app/presentation/category/widget/custom_Icon_picker.dart';
import 'package:todo_app/presentation/category/widget/custom_category_color.dart';
import 'package:todo_app/presentation/category/widget/custom_button.dart';
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
                StringManger.kCreateNewCategory,
                style: TextStyle(
                    color: ColorManger.kWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                StringManger.kCategoryName,
                style: TextStyle(
                  color: ColorManger.kWhiteColor,
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
                StringManger.kCategoryIcon,
                style: TextStyle(
                  color: ColorManger.kWhiteColor,
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
                    TextColor: ColorManger.kHeliotrop,
                  ),
                  CustomButton(
                    title: 'Create Category',
                    TextColor: ColorManger.kWhiteColor,
                    color: ColorManger.kHeliotrop,
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
