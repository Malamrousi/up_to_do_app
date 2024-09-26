//packge
import 'package:flutter/material.dart';
import 'package:todo_app/constant/color_manger.dart';

import 'package:todo_app/constant/size_manger.dart';
//constant
import 'package:todo_app/constant/string_manger.dart';
import 'package:todo_app/data/controller/validator.dart';

//widget
import '../../../widgets/custom_auth_button.dart';
import '../../../widgets/custom_from_text_filed.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Validator validator = Validator();

  @override
  Widget build(BuildContext context) {
    return Form(
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
                setState(() {});
              },
              obscureText: false,
              validator: validator.passwordValidator,
            ),
            const SizedBox(
              height: HightManger.H48,
            ),
            CustomFromTextFiled(
              keyboardType: TextInputType.visiblePassword,
              label: StringManger.KPassword,
              hintText: StringManger.KEnteryourpassword,
              onSaved: (value) {
                setState(() {});
              },
              obscureText: true,
              validator: validator.emailValidator,
            ),
            const SizedBox(
              height: HightManger.H48,
            ),
            CustomAuthButton(
              color: ColorManger.KHeliotrop,
              title: StringManger.kLogin,
              onPressed: () {},
            ),
          ],
        ));
  }
}
