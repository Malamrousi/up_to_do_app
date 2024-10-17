import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/utils/color_manger.dart';
import 'package:todo_app/core/utils/route_name.dart';
import 'package:todo_app/data/models/catgeroy_model_items.dart';
import '../../../data/controller/category_controller.dart';
import '../../../data/models/category_model.dart';
import '../../category/widget/custom_button.dart';

class TaskCategoryItems extends StatefulWidget {
  const TaskCategoryItems({super.key, required this.selectedCategory});
  final void Function(Map<String, dynamic> category) selectedCategory;
  @override
  State<TaskCategoryItems> createState() => _TaskCategoryItemsState();
}

class _TaskCategoryItemsState extends State<TaskCategoryItems> {
  final CategoryController categoryController = Get.find<CategoryController>();
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
              child: Obx(() {
                final allCategories = [
                 ... CategoryModelItem.categoryModel,
                  ...categoryController.categories,
                ];
                return GridView.builder(
                  itemCount: allCategories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    var category = allCategories[index];
                    if (category is CategoryModelItem) {
                      return GestureDetector(
                        onTap: () {
                          widget.selectedCategory({
                            'name': category.name,
                            'color': category.color.value.toString(),
                            'image': category.image
                          });

                          Get.back();
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: category.color,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(category.image),
                            ),
                            Text(
                              category.name,
                              style: const TextStyle(
                                  color: ColorManger.kWhiteColor, fontSize: 14),
                            ),
                          ],
                        ),
                      );
                    } else if (category is CategoryModel) {
                      return GestureDetector(
                        onTap: () {
                           widget.selectedCategory({
                            'name': category.categoryName,
                            'color': category.color,
                            'icon': category.icon,
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Color(int.parse(category.color)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                IconData(
                                  int.parse(category.icon),
                                  fontFamily: 'MaterialIcons',
                                ),
                                size: 30,
                                color: Color(int.parse(category.color))
                                    .withOpacity(1),
                              ),
                            ),
                            Text(
                              category.categoryName,
                              style: const TextStyle(
                                  color: ColorManger.kWhiteColor, fontSize: 14),
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                );
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              onPressed: () {
                Get.toNamed(RouteName.kCategoryScreens);
              },
              TextColor: ColorManger.kWhiteColor,
              color: ColorManger.kHeliotrop,
              title: 'Add Category',
            ),
          ],
        ),
      ),
    );
  }
}
