//package
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constant/color_manger.dart';
//constant
import 'package:todo_app/constant/route_name.dart';
import 'package:todo_app/presentation/screen/auth/verify_email.dart';
//screen
import 'package:todo_app/presentation/screen/on_boarding/Intro_screen%20.dart';
import 'package:todo_app/presentation/screen/up_to_do.dart';
import 'package:todo_app/presentation/screen/auth/start_screen.dart';
import 'package:todo_app/presentation/screen/auth/register.dart';
import 'package:todo_app/presentation/screen/home/screen/home_screen.dart';
import 'package:todo_app/presentation/screen/auth/login.dart';
//controller

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        GetPage(name: RouteName.kOnBoarding, page: () => const IntroScreen()),
        GetPage(
          name: RouteName.KStartScreen,
          page: () => const StartScreen(),
        ),
        GetPage(
            name: RouteName.KRegisterScreen,
            page: () => const RegisterScreen()),
        GetPage(name: RouteName.KLoginScreen, page: () => const LoginScreen()),
        GetPage(name: RouteName.kHomeScreen, page: () => const HomeScreen()),
        GetPage(name: RouteName.KupToDo, page: () => const UpToDoScreen()),
        GetPage(name: RouteName.kVerfiyYourEmail, page: () => const VerifyEmailScreen()),
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
