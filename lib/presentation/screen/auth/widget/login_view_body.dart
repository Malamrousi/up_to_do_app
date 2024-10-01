//packge
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constant/color_manger.dart';
import 'package:todo_app/constant/route_name.dart';
import 'package:todo_app/constant/size_manger.dart';
//constant
import 'package:todo_app/constant/string_manger.dart';
//widget
import 'custom_divider.dart';
import 'log_in_form.dart';
import 'login_social_auth.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
              StringManger.kLogin,
              style: TextStyle(
                color: ColorManger.KWhiteColor,
                fontSize: FontSizeValue.Fv32,
              ),
            ),
            const    LogInForm(),
                const SizedBox(
                  height: HightManger.H30,
                ),
                const CustomDivider(),
                const SizedBox(
                  height: HightManger.H30,
                ),
              const  LoginSocialAuth(),
                const SizedBox(
                  height: HightManger.H48,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      StringManger.KDonthaveanaccount,
                      style: TextStyle(
                          color: ColorManger.KDividerColor,
                          fontSize: FontSizeValue.Fv16),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RouteName.KRegisterScreen);
                      },
                      child: const Text(
                        StringManger.KRegister,
                        style: TextStyle(
                            color: ColorManger.KWhiteColor,
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
