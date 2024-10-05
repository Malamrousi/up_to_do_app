import 'package:flutter/material.dart';
//constant
import 'package:todo_app/constant/color_manger.dart';
import 'package:todo_app/constant/image_manger.dart';
import 'package:todo_app/constant/size_manger.dart';
import 'package:todo_app/constant/string_manger.dart';

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
          color: ColorManger.KWhiteColor,
        ),
        title: const Text(StringManger.kindex),
        actions: [
          Image.asset(
            ImageManger.kprofile,
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
