import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/controller/authentication_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationController authenticationController = Get.find();
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: authenticationController.signOut, icon: Icon(Icons.logout ,
        size: 32,
        color: Colors.white,))],
      ),
    );
  }
}
