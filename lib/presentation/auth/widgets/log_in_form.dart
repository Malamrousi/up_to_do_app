//packge
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/utils/color_manger.dart';
import 'package:todo_app/core/utils/size_manger.dart';
//constant
import 'package:todo_app/core/utils/string_manger.dart';
import 'package:todo_app/data/helpers/validator.dart';
//widget
import '../../../data/controller/auth_contoller.dart';
import 'custom_auth_button.dart';
import 'custom_from_text_filed.dart';
//controller

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // final AuthenticationController authContoller = Get.find();
  final AuthContoller authController = AuthContoller.to;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: HightManger.H48,
            ),
            CustomFromTextFiled(
              controller: authController.emailController,
              keyboardType: TextInputType.emailAddress,
              label: StringManger.kEmail,
              hintText: StringManger.kEnterYourEmail,
              onSaved: (value) {
                authController.emailController.text = value;
              },
              obscureText: false,
              validator: Validator().email,
            ),
            const SizedBox(
              height: HightManger.H48,
            ),
            CustomFromTextFiled(
              controller: authController.passwordController,
              keyboardType: TextInputType.visiblePassword,
              label: StringManger.kPassword,
              hintText: StringManger.kEnterYourPassword,
              onSaved: (value) {
                authController.passwordController.text = value;
              },
              obscureText: true,
              validator: Validator().password,
            ),
            const SizedBox(
              height: HightManger.H48,
            ),
            GetBuilder<AuthContoller>(builder: (contoller) {
              if (authController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return CustomAuthButton(
                  color: ColorManger.kHeliotrop,
                  title: StringManger.kLogin,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      authController.signInWithEmailAndPassword(context);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              }
            })
          ],
        ));
  }
}
