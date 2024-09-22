import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
//constant
import '../../../constant/string_manger.dart';
import 'package:todo_app/constant/color_manger.dart';
import 'package:todo_app/constant/size_manger.dart';
//screen
import '../../widgets/custom_auth_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),

        // leading: const Icon(
        //   Icons.arrow_back_ios,
        //   color: ColorManger.KWhiteColor,
        // ),
      ),
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
                  onPressed: () {},
                ),
                const Gap(30),
                CustomAuthButton(
                  title: StringManger.kcreateAccount,
                  onPressed: () {},
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
