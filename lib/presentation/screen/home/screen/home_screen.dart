import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/controller/auth_contoller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {


    final authController = Get.find<AuthContoller>();

    return Scaffold(
      
      appBar: AppBar(
        actions: [IconButton(onPressed: authController.signOut, icon: Icon(Icons.logout ,
        size: 32,
        color: Colors.white,))],
      ),
    );
  }
}
