import 'package:flutter/material.dart';
//constant
import 'package:todo_app/core/utils/color_manger.dart';
import 'package:todo_app/core/utils/image_manger.dart';
import 'package:todo_app/core/utils/size_manger.dart';
import 'package:todo_app/core/utils/string_manger.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: AppBar(
        centerTitle: true,
        leading: const Icon(
          Icons.filter_list,
          color: ColorManger.kWhiteColor,
        ),
        title: const Text(StringManger.kIndex),
        actions: [
          Image.asset(
            ImageManger.kProfile,
            width: WidthManger.W42,
            height: HightManger.H42,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
