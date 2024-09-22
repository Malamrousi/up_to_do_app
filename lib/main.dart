//package
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constant/color_manger.dart';
//constant
import 'package:todo_app/constant/route_name.dart';
//screen
import 'package:todo_app/presentation/screen/on_boarding/Intro_screen%20.dart';
import 'package:todo_app/presentation/screen/up_to_do.dart';
import 'package:todo_app/presentation/screen/auth/start_screen.dart';

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
        GetPage(name: RouteName.KupToDo, page: () => const UpToDoScreen()),
        GetPage(
            name: RouteName.KMangeTaskSplash, page: () => const IntroScreen()),
        GetPage(
          name: RouteName.KHelloScreen,
          page: () => const StartScreen(),
        ),
      ],
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
         
             
              color: ColorManger.KPrimaryColor,
              foregroundColor: ColorManger.KWhiteColor),
          fontFamily: 'Lato',
          scaffoldBackgroundColor: ColorManger.KPrimaryColor),
    );
  }
}
