import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/utils/color_manger.dart';
import 'package:todo_app/core/utils/route_name.dart';
import 'package:todo_app/data/models/catgeroy_model_items.dart';

import 'custom_button.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.bottomSheet(
            const TaskPriorityItems(),
          );
        },
        icon: const Icon(
          Icons.label_outline,
          color: ColorManger.kWhiteColor,
          size: 24,
        ));
  }
}

class TaskPriorityItems extends StatelessWidget {
  const TaskPriorityItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManger.kMineshaft,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose Category',
              style: TextStyle(
                  color: ColorManger.kWhiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Color(0xff979797),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: GridView.builder(
                    itemCount: CategoryModelItem.catgeroyModel.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Container(
                                    width: 64,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: CategoryModelItem
                                          .catgeroyModel[index].color,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(CategoryModelItem
                                        .catgeroyModel[index].image)),
                                Text(
                                  CategoryModelItem.catgeroyModel[index].name,
                                  style: const TextStyle(
                                      color: ColorManger.kWhiteColor,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    })),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              width: 289,
              hight: 48,
              onPressed: () {
                Get.toNamed(RouteName.kCategoryScreens);
              },
              TextColor: ColorManger.kWhiteColor,
              color: ColorManger.kHeliotrop,
              title: 'Add Category',
            )
          ],
        ),
      ),
    );
  }
}
