//packge
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constant/color_manger.dart';
import 'package:todo_app/constant/route_name.dart';

import 'package:todo_app/constant/size_manger.dart';
//constant
import 'package:todo_app/constant/string_manger.dart';
import 'package:todo_app/data/services/validator.dart';

//widget
import '../../../widgets/custom_auth_button.dart';
import '../../../widgets/custom_from_text_filed.dart';
//controller
import '../../../../data/controller/authentication_controller.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Validator validator = Validator();
  final AuthenticationController authContoller = Get.find();

  late TextEditingController email, password;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }

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
              keyboardType: TextInputType.emailAddress,
              label: StringManger.KEmail,
              hintText: StringManger.KEnteryourEmail,
              onSaved: (value) {
                email.text = value;
              },
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }

                return null;
              },
            ),
            const SizedBox(
              height: HightManger.H48,
            ),
            CustomFromTextFiled(
              keyboardType: TextInputType.visiblePassword,
              label: StringManger.KPassword,
              hintText: StringManger.KEnteryourpassword,
              onSaved: (value) {
                password.text = value;
              },
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }

                return null;
              },
            ),
            const SizedBox(
              height: HightManger.H48,
            ),
            CustomAuthButton(
              color: ColorManger.KHeliotrop,
              title: StringManger.kLogin,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  authContoller.login(email.text, password.text).then((_) {
                    User? user = FirebaseAuth.instance.currentUser;
                    if (user!.emailVerified) {
                      Get.offAllNamed(RouteName.kHomeScreen);
                    } else {
                      Get.offNamed(RouteName.kVerfiyYourEmail);
                    }
                  });
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ],
        ));
  }
}
