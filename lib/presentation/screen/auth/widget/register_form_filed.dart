//packge
import 'package:flutter/material.dart';
import 'package:todo_app/constant/color_manger.dart';
import 'package:todo_app/constant/size_manger.dart';
//constant
import 'package:todo_app/constant/string_manger.dart';

//widget
import '../../../../data/controller/validator.dart';
import '../../../widgets/custom_auth_button.dart';
import '../../../widgets/custom_from_text_filed.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Validator validator = Validator();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
        child: Column(
      children: [
        CustomFromTextFiled(
          keyboardType: TextInputType.name,
          label: StringManger.kUsername,
          hintText: StringManger.KEnteryourName,
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
          obscureText: false,
          validator: validator.passwordValidator,
        ),
        const SizedBox(
          height: HightManger.H48,
        ),
        CustomFromTextFiled(
          keyboardType: TextInputType.visiblePassword,
          label: StringManger.kConfirmPassword,
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
          title: StringManger.KRegister,
          onPressed: () {},
        ),
        const SizedBox(
          height: HightManger.H30,
        ),
      ],
    ));
  }
}
