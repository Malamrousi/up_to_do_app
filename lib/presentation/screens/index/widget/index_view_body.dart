import 'package:flutter/material.dart';
import 'package:todo_app/constant/color_manger.dart';
//CONSTANT
import 'package:todo_app/constant/image_manger.dart';
import 'package:todo_app/constant/string_manger.dart';
import 'package:todo_app/presentation/screens/index/widget/custom_app_bar.dart';

import '../../../../constant/size_manger.dart';

class IndexViewBody extends StatelessWidget {
  const IndexViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomAppBar(),
        const  Spacer(
            flex: 2,
          ),
          SizedBox(
            width: WidthManger.W227,
            height: HightManger.H227,
            child: Image.asset(ImageManger.kHome),
          ),
          const Text(
            StringManger.kWhatdoyouwanttodotoday,
            style: TextStyle(color: ColorManger.KWhiteColor, fontSize: 20),
          ),
          const Text(
            StringManger.ktoaddyourtasks,
            style: TextStyle(color: ColorManger.KWhiteColor, fontSize: 16),
          ),
         const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
