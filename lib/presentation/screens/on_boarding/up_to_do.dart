//package
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//constant
import '../../../constant/image_manger.dart';
import 'package:todo_app/constant/size_manger.dart';
import 'package:todo_app/constant/route_name.dart';

import '../../../data/controller/auth_contoller.dart';

class UpToDoScreen extends StatelessWidget {
  const UpToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthContoller>();
    Future.delayed(const Duration(seconds: 1), () {
      if (authController.firebaseUser.value != null) {
        Get.offAllNamed(RouteName.kindexScreen); 
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
            ImageManger.KupToDo,
            width: WidthManger.W113,
            height: HightManger.H113,
          ),
        ),
      ),
    );
  }
}
