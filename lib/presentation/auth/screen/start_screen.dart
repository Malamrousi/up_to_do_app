import 'package:flutter/material.dart';
import 'package:get/get.dart';
//constant
import '../../../core/utils/string_manger.dart';
import 'package:todo_app/core/utils/color_manger.dart';
import 'package:todo_app/core/utils/size_manger.dart';
import 'package:todo_app/core/utils/route_name.dart';
//Widget
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_auth_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(PaddingManger.P20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Column(
              children: [
                Text(
                  StringManger.kWelcomeToUpTodo,
                  style: TextStyle(
                      color: ColorManger.kWhiteColor,
                      fontSize: FontSizeValue.Fv32,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  textAlign: TextAlign.center,
                  StringManger.kLoginOrCreate,
                  style: TextStyle(
                    color: ColorManger.kWhiteColor,
                    fontSize: FontSizeValue.Fv16,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                CustomAuthButton(
                  title: StringManger.kLogin,
                  color: ColorManger.kHeliotrop,
                  onPressed: () {
                    Get.toNamed(RouteName.kLoginScreen);
                  },
                ),
                const SizedBox(
                  height: HightManger.H30,
                ),
                CustomAuthButton(
                  title: StringManger.kCreateAccount,
                  onPressed: () {
                    Get.toNamed(RouteName.kRegisterScreen);
                  },
                ),
                const SizedBox(
                  height: HightManger.H30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
