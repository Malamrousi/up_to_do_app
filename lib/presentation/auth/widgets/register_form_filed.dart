//packge
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/utils/color_manger.dart';
import 'package:todo_app/core/utils/size_manger.dart';
//constant
import 'package:todo_app/core/utils/string_manger.dart';

//widget
import '../../../data/controller/auth_contoller.dart';
import '../../../data/helpers/validator.dart';
import 'custom_auth_button.dart';
import 'custom_from_text_filed.dart';

//controller

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthController authController = AuthController.to;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: Column(
          children: [
            CustomFromTextFiled(
              controller: authController.nameController,
              keyboardType: TextInputType.name,
              label: StringManger.kUsername,
              hintText: StringManger.kEnterYourName,
              onSaved: (value) {
                authController.nameController.text = value;
              },
              obscureText: false,
              validator: Validator().name,
            ),
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
              obscureText: false,
              validator: Validator().password,
            ),
            const SizedBox(
              height: HightManger.H48,
            ),
            GetBuilder<AuthController>(builder: (contoller) {
              if (authController.isLoading.value){
             return   const Center(
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
            }),
            const SizedBox(
              height: HightManger.H30,
            ),
          ],
        ));
  }
}
