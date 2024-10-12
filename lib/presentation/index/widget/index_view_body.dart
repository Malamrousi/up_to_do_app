import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/color_manger.dart';
//CONSTANT
import 'package:todo_app/core/utils/image_manger.dart';
import 'package:todo_app/core/utils/string_manger.dart';
import 'package:todo_app/presentation/index/widget/custom_app_bar.dart';

import '../../../core/utils/size_manger.dart';

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
    );
  }
}
