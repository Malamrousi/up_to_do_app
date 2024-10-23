import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/utils/color_manger.dart';
import '../../../core/utils/image_manger.dart';
import '../../../core/utils/size_manger.dart';
import '../../../core/utils/string_manger.dart';
import '../../../data/controller/category_controller.dart';
import '../../../data/controller/task_controller.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  final TaskController taskCardController = Get.find<TaskController>();
  final CategoryController categoryController = Get.find<CategoryController>();



  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (taskCardController.tasks.isEmpty) {
        return  Expanded(
          child: SizedBox(
                width: double.infinity,
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                
          
            SizedBox(
              width: WidthManger.W227,
              height: HightManger.H227,
              child: Image.asset(ImageManger.kHome),
            ),
            const Text(
              StringManger.kWhatDoYouWantToDoToday,
              style: TextStyle(color: ColorManger.kWhiteColor, fontSize: 20),
            ),
             const Text(
              StringManger.kToAddYourTasks,
              style: TextStyle(color: ColorManger.kWhiteColor, fontSize: 16),
            ),
           const Spacer(
              flex: 2,
            ),
          ],
                ),
              ),
        );
      } else {
        return Expanded(
          child: ListView.builder(
          itemCount: taskCardController.tasks.length,
          itemBuilder: (context, index) {
            final task = taskCardController.tasks[index];
          
            final category = task.category;
          
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              height: 100,
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: ColorManger.kMineshaft,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    shape: const CircleBorder(
                      side: BorderSide(color: Colors.white),
                    ),
                    value: task.isDone ?? false,
                    onChanged: (value) {
                      taskCardController.updateTaskStatus(
                 
                        iSDone: value,
                        endTime: DateTime.now(),
                      );
                    },
                    fillColor: const WidgetStatePropertyAll(Colors.transparent),
                    checkColor: ColorManger.kWhiteColor,
                    activeColor: ColorManger.kWhiteColor,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          style: const TextStyle(
                            color: ColorManger.kWhiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          task.description,
                          style: const TextStyle(
                            color: ColorManger.kSilver,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              "Start: ${task.startTime}",
                              style: const TextStyle(
                                color: ColorManger.kSilver,
                                fontSize: 14,
                              ),
                            ),
                            const Spacer(),
                          
                              Container(
                                width: 87,
                                height: 29,
                                decoration: BoxDecoration(
                                  color: Color(int.parse(category['color'])),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      category['image'],
                                      width: 20,
                                      height: 15,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      category['name'],
                                      style: const TextStyle(
                                        color: ColorManger.kWhiteColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            const SizedBox(width: 8),
                            Container(
                              width: 42,
                              height: 29,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: ColorManger.kHeliotrop,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImageManger.kFlag,
                                    width: 20,
                                    height: 15,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${task.taskPriority}',
                                    style: const TextStyle(
                                      color: ColorManger.kWhiteColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
                ),
        );
      }
    });
  }
}
