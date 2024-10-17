import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/utils/color_manger.dart';

import 'package:todo_app/presentation/index/widget/task_category_item.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({super.key, this.selectedCategory});
  final  Function(Map<String, dynamic> category)? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.bottomSheet(
             TaskCategoryItems(
              selectedCategory: selectedCategory!,
            ),
          );
        },
        icon: const Icon(
          Icons.label_outline,
          color: ColorManger.kWhiteColor,
          size: 24,
        ));
  }
}
