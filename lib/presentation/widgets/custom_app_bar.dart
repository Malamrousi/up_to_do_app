import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar buildAppBar(){
  return AppBar(
  
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
    
  );

}