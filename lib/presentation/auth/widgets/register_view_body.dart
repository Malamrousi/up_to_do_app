//packge
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//constant
import 'package:todo_app/core/utils/color_manger.dart';
import 'package:todo_app/core/utils/route_name.dart';
import 'package:todo_app/core/utils/size_manger.dart';
import 'package:todo_app/core/utils/string_manger.dart';
//widget
import 'custom_divider.dart';
import 'register_social_auth.dart';
import 'package:todo_app/presentation/auth/widgets/register_form_filed.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(PaddingManger.P30),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  StringManger.kRegister,
                  style: TextStyle(
                    color: ColorManger.kWhiteColor,
                    fontSize: FontSizeValue.Fv32,
                  ),
                ),
                const SizedBox(
                  height: HightManger.H48,
                ),
                const RegisterForm(),
                const CustomDivider(),
                const SizedBox(
                  height: HightManger.H30,
                ),
                const RegisterSocialAuth(),
                const SizedBox(
                  height: HightManger.H48,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      StringManger.kHaveAnAccount,
                      style: TextStyle(
                          color: ColorManger.kDividerColor,
                          fontSize: FontSizeValue.Fv16),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RouteName.kLoginScreen);
                      },
                      child: const Text(
                        StringManger.kLogin,
                        style: TextStyle(
                            color: ColorManger.kWhiteColor,
                            fontSize: FontSizeValue.Fv16),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
