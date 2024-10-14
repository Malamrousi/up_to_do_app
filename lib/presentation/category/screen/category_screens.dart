import 'package:flutter/material.dart';
import 'package:get/get.dart';

// constant
import 'package:todo_app/core/utils/color_manger.dart';
import 'package:todo_app/core/utils/string_manger.dart';
import 'package:todo_app/data/models/category_model.dart';
import 'package:todo_app/presentation/category/widget/custom_Icon_picker.dart';
import 'package:todo_app/presentation/category/widget/custom_category_color.dart';
import 'package:todo_app/presentation/category/widget/custom_button.dart';
import '../../../data/controller/category_controller.dart';
import '../widget/custom_category_text_filed.dart';

class CategoryScreens extends StatefulWidget {
  const CategoryScreens({super.key});

  @override
  _CategoryScreensState createState() => _CategoryScreensState();
}

class _CategoryScreensState extends State<CategoryScreens> {
  final TextEditingController categoryNameController = TextEditingController();
  IconData? _iconData;

  Color? _selectedColor = Colors.blue;

  final CategoryController categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                StringManger.kCreateNewCategory,
                style: TextStyle(
                    color: ColorManger.kWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                StringManger.kCategoryName,
                style: TextStyle(
                  color: ColorManger.kWhiteColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomCategoryTextFiled(categoryName: categoryNameController),
              const SizedBox(
                height: 20,
              ),
              const Text(
                StringManger.kCategoryIcon,
                style: TextStyle(
                  color: ColorManger.kWhiteColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              IconPicker(
                onIconPicked: (icon) {
                  setState(() {
                    _iconData = icon;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomCategoryColor(
                colorPicked: (color) {
                  setState(() {
                    _selectedColor = color;
                  });
                },
              ),
              const Spacer(),
              Row(
                children: [
                  CustomButton(
                    onPressed: () {
                      Get.back();
                    },
                    title: 'Cancel',
                    TextColor: ColorManger.kHeliotrop,
                  ),
                  CustomButton(
                    onPressed: () {
                      if (_iconData != null) {
                        final newCategory = CategoryModel(
                            categoryName: categoryNameController.text,
                            icon: _iconData!.codePoint.toString(),
                            color: _selectedColor!.value.toString());
                        categoryController.addCategories(newCategory);
                        Get.back();
                      }
                    },
                    title: 'Create Category',
                    TextColor: ColorManger.kWhiteColor,
                    color: ColorManger.kHeliotrop,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
