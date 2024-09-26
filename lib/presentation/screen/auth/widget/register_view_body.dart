//packge
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constant/color_manger.dart';
import 'package:todo_app/constant/route_name.dart';
import 'package:todo_app/constant/size_manger.dart';
//constant
import 'package:todo_app/constant/string_manger.dart';
import 'package:todo_app/data/controller/validator.dart';
import 'package:todo_app/presentation/screen/auth/widget/register_form_filed.dart';
//widget
import 'register_social_auth.dart';

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
                  StringManger.KRegister,
                  style: TextStyle(
                    color: ColorManger.KWhiteColor,
                    fontSize: FontSizeValue.Fv32,
                  ),
                ),
                const SizedBox(
                  height: HightManger.H48,
                ),
                const RegisterForm(),
                const Row(children: <Widget>[
                  Expanded(
                      child: Divider(
                    color: ColorManger.KDividerColor,
                  )),
                  Text(
                    StringManger.Kor,
                    style: TextStyle(
                        color: ColorManger.KDividerColor,
                        fontSize: FontSizeValue.Fv16),
                  ),
                  Expanded(
                      child: Divider(
                    color: ColorManger.KDividerColor,
                  )),
                ]),
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
                      StringManger.Khaveanaccount,
                      style: TextStyle(
                          color: ColorManger.KDividerColor,
                          fontSize: FontSizeValue.Fv16),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RouteName.KLoginScreen);
                      },
                      child: const Text(
                        StringManger.kLogin,
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
