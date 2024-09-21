//package
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//constant
import '../../constant/image_manger.dart';
import 'package:todo_app/constant/size_manger.dart';
import 'package:todo_app/constant/route_name.dart';

class UpToDoScreen extends StatelessWidget {
  const UpToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
    ).then((_) {
      Get.offNamed(RouteName.KMangeTaskSplash);
    });
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: WidthManger.W140,
          height: HightManger.H180,
          child: Image.asset(
            ImageManger.KupToDo,
            width: WidthManger.W113,
            height: HightManger.H113,
          ),
        ),
      ),
    );
  }
}
