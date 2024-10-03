import 'package:flutter/material.dart';
import 'package:get/get.dart';
//constant
import '../../../constant/string_manger.dart';
import 'package:todo_app/constant/color_manger.dart';
import 'package:todo_app/constant/size_manger.dart';
import 'package:todo_app/constant/route_name.dart';
//Widget
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_auth_button.dart';

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
                  StringManger.kWelcometopTodo,
                  style: TextStyle(
                      color: ColorManger.KWhiteColor,
                      fontSize: FontSizeValue.Fv32,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  textAlign: TextAlign.center,
                  StringManger.kLoginOrCreate,
                  style: TextStyle(
                    color: ColorManger.KWhiteColor,
                    fontSize: FontSizeValue.Fv16,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                CustomAuthButton(
                  title: StringManger.kLogin,
                  color: ColorManger.KHeliotrop,
                  onPressed: () {
                    Get.toNamed(RouteName.KLoginScreen);
                  },
                ),
                const SizedBox(
                  height: HightManger.H30,
                ),
                CustomAuthButton(
                  title: StringManger.kcreateAccount,
                  onPressed: () {
                    Get.toNamed(RouteName.KRegisterScreen);
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
