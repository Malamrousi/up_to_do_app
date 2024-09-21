//package
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//screen
import 'package:todo_app/constant/route_name.dart';
import 'package:todo_app/presentation/screen/splash/up_to_do.dart';
import 'package:todo_app/constant/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     home: const UpToDoScreen(),
      getPages: [
        GetPage(
          name: RouteName.KupToDo, page: () => const UpToDoScreen()
          ),
      ],
      theme: ThemeData(scaffoldBackgroundColor: ColorManger.KPrimaryColor),
    );
  }
}
