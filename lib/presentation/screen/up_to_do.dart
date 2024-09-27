//package
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//constant
import '../../constant/image_manger.dart';
import 'package:todo_app/constant/size_manger.dart';
import 'package:todo_app/constant/route_name.dart';

import '../../data/controller/authentication_controller.dart';

class UpToDoScreen extends StatelessWidget {
  const UpToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthenticationController());

    Future.delayed(
      const Duration(seconds: 3),
    ).then((_) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && user.emailVerified) {
        Get.offAllNamed(RouteName.kHomeScreen);
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
