import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/utils/image_manger.dart';

import '../../../core/utils/color_manger.dart';
import 'custom_button.dart';

class TaskPriority extends StatefulWidget {
  const TaskPriority({super.key, required this.prioritySelected});
  final void Function(int) prioritySelected;

  @override
  State<TaskPriority> createState() => _TaskPriorityState();
}

class _TaskPriorityState extends State<TaskPriority> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.bottomSheet(
            TaskPriorityItems(
              prioritySelected: widget.prioritySelected,
            ),
          );
        },
        icon: const Icon(Icons.flag_outlined,
            size: 24, color: ColorManger.kWhiteColor));
  }
}

class TaskPriorityItems extends StatefulWidget {
  const TaskPriorityItems({super.key, required this.prioritySelected});

  final void Function(int) prioritySelected;

  @override
  State<TaskPriorityItems> createState() => _TaskPriorityItemsState();
}

class _TaskPriorityItemsState extends State<TaskPriorityItems> {
  int activeIndex = 0;
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Task Priority',
              style: TextStyle(
                  color: ColorManger.kWhiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Color(0xff979797),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activeIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: activeIndex == index
                                ? ColorManger.kHeliotrop
                                : ColorManger.kMineshaft,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 64,
                              height: 64,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImageManger.kFlag,
                                  ),
                                  Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                        color: ColorManger.kWhiteColor,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomButton(
                  width: 153,
                  hight: 48,
                  onPressed: () {
                    Get.back();
                  },
                  textColor: ColorManger.kHeliotrop,
                  title: 'Cancel',
                ),
                CustomButton(
                  width: 153,
                  hight: 48,
                  onPressed: () {
                    widget.prioritySelected(activeIndex);
                    Get.back();
                  },
                  textColor: ColorManger.kWhiteColor,
                  color: ColorManger.kHeliotrop,
                  title: 'Save',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
