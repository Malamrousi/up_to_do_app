import 'package:flutter/material.dart';
import 'package:get/get.dart';

//constant
import '../../core/utils/image_manger.dart';
import 'package:todo_app/core/utils/size_manger.dart';
import 'package:todo_app/core/utils/route_name.dart';

import '../../data/controller/auth_contoller.dart';

class UpToDoScreen extends StatelessWidget {
  const UpToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    Future.delayed(const Duration(seconds: 10), () {
      if (authController.firebaseUser.value != null) {
        Get.offAllNamed(RouteName.kIndexScreen);
      } else {
        Get.offAllNamed(RouteName.kOnBoarding); 
      }
    });
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: WidthManger.W140,
          height: HightManger.H180,
          child: Image.asset(
            ImageManger.kupToDo,
            width: WidthManger.W113,
            height: HightManger.H113,
          ),
        ),
      ),
    );
  }
}
