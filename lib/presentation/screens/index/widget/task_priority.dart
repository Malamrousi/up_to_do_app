import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constant/image_manger.dart';

import '../../../../constant/color_manger.dart';
import 'custom_button.dart';

class TaskPriority extends StatelessWidget {
  const TaskPriority({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.bottomSheet(
            const TaskPriorityItems(),
          );
        },
        icon: const Icon(Icons.flag_outlined,
            size: 24, color: ColorManger.KWhiteColor));
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Task Priority',
              style: TextStyle(
                  color: ColorManger.KWhiteColor,
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
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff272727),
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
                                  ImageManger.kflag,
                                ),
                                Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                      color: ColorManger.KWhiteColor,
                                      fontSize: 16),
                                )
                              ],
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
                  onPressed: () {},
                  TextColor: ColorManger.KHeliotrop,
                  title: 'Cancel',
                ),
                CustomButton(
                    width: 153,
                  hight: 48,
                  onPressed: () {},
                  TextColor: ColorManger.KWhiteColor,
                  color: ColorManger.KHeliotrop,
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
