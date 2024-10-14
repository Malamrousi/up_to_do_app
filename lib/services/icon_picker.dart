import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/color_manger.dart';

Future<IconData?> showIconPicker(
    {required BuildContext context, IconData? defalutIcon}) async {
  final List<IconData> allIcons = [
    // Grocery
    Icons.shopping_cart,
    Icons.local_mall,
    Icons.fastfood,
    Icons.local_dining,

    // Work
    Icons.business_center,
    Icons.cases,
    Icons.assignment,
    Icons.insert_chart_outlined,

    // Sport
    Icons.sports,
    Icons.fitness_center,
    Icons.sports_basketball,
    Icons.directions_run,

    // Design
    Icons.brush,
    Icons.palette,
    Icons.auto_fix_high,
    Icons.photo_camera,

    // University
    Icons.class_,
    Icons.menu_book,
    Icons.laptop_chromebook,
    Icons.science,

    // Social
    Icons.people,
    Icons.message,
    Icons.chat,
    Icons.forum,

    // Music
    Icons.library_music,
    Icons.audiotrack,
    Icons.headset,
    Icons.queue_music,

    // Health
    Icons.local_hospital,
    Icons.fitness_center,
    Icons.medical_services,
    Icons.volunteer_activism,

    // Movie
    Icons.tv,
    Icons.video_library,
    Icons.theaters,
    Icons.live_tv,

    // Home
    Icons.kitchen,
    Icons.bed,
    Icons.bathroom,
    Icons.garage,

    // General To-Do
    Icons.check_circle,
    Icons.alarm,
    Icons.calendar_today,
    Icons.pending_actions,
    Icons.event_note,
    Icons.done_all,
    Icons.priority_high,
    Icons.notifications_active,
    Icons.schedule,
    Icons.hourglass_bottom,
  ];

  IconData? selectedIcon = defalutIcon;

  await showDialog(
      context: context,
      builder: (_) => AlertDialog(
            backgroundColor: ColorManger.kMineshaft,
            title: const Text(
              'Pick an Icon',
              style: TextStyle(color: ColorManger.kWhiteColor),
            ),
            content: Container(
              width: 320,
              height: 400,
              alignment: Alignment.center,
              // This grid view displays all selectable icons
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 60,
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: allIcons.length,
                  itemBuilder: (_, index) => Container(
                        key: ValueKey(allIcons[index].codePoint),
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: IconButton(
                            // give the selected icon a different color
                            color: selectedIcon == allIcons[index]
                                ? ColorManger.kHeliotrop
                                : ColorManger.kWhiteColor,
                            iconSize: 30,
                            icon: Icon(
                              allIcons[index],
                            ),
                            onPressed: () {
                              selectedIcon = allIcons[index];
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      )),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'))
            ],
          ));

  return selectedIcon;
}
