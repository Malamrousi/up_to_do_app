//package
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/utils/bindings%20.dart';
import 'package:todo_app/core/utils/color_manger.dart';

//constant
import 'package:todo_app/core/utils/route_name.dart';

//screen
import 'package:todo_app/presentation/on_boarding/Intro_screen%20.dart';
import 'package:todo_app/presentation/on_boarding/up_to_do.dart';
import 'package:todo_app/presentation/auth/screen/start_screen.dart';
import 'package:todo_app/presentation/auth/screen/register.dart';
import 'package:todo_app/presentation/index/screen/index_screen.dart';
import 'package:todo_app/presentation/auth/screen/login.dart';
import 'package:todo_app/presentation/category/screen/category_screens.dart';

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
      initialBinding: RootBinding(),
      home: const UpToDoScreen(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: RouteName.kUpToDo,
          page: () => const UpToDoScreen(),
        ),
        GetPage(name: RouteName.kOnBoarding, page: () => const IntroScreen()),
        GetPage(name: RouteName.kOnBoarding, page: () => const IntroScreen()),
        GetPage(
          name: RouteName.kStartScreen,
          page: () => const StartScreen(),
        ),
        GetPage(
            name: RouteName.kRegisterScreen,
            page: () => const RegisterScreen()),
        GetPage(name: RouteName.kLoginScreen, page: () => const LoginScreen()),
        GetPage(name: RouteName.kIndexScreen, page: () => const IndexScreen()),
        GetPage(name: RouteName.kUpToDo, page: () => const UpToDoScreen()),
        GetPage(
            name: RouteName.kCategoryScreens,
            page: () => const CategoryScreens()),
      ],
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: ColorManger.kPrimaryColor,
              foregroundColor: ColorManger.kWhiteColor),
          fontFamily: 'Lato',
          scaffoldBackgroundColor: ColorManger.kPrimaryColor),
    );
  }
}
