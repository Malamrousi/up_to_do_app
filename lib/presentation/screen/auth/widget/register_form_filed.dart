//packge
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constant/color_manger.dart';
import 'package:todo_app/constant/route_name.dart';
import 'package:todo_app/constant/size_manger.dart';
//constant
import 'package:todo_app/constant/string_manger.dart';

//widget
import '../../../../data/services/validator.dart';
import '../../../widgets/custom_auth_button.dart';
import '../../../widgets/custom_from_text_filed.dart';

//controller
import '../../../../data/controller/authentication_controller.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Validator validator = Validator();
  final AuthenticationController authContoller = Get.find();

  late TextEditingController email, password, userName, confirmPassword;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
    userName = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    userName.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: Column(
          children: [
            CustomFromTextFiled(
              keyboardType: TextInputType.name,
              label: StringManger.kUsername,
              hintText: StringManger.KEnteryourName,
              onSaved: (value) {
                userName.text = value;
              },
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }

                return null;
              },
            ),
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
                  return 'Please enter a email';
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
            CustomAuthButton(
              color: ColorManger.KHeliotrop,
              title: StringManger.KRegister,
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  await authContoller
                      .createUser(email.text, password.text, userName.text)
                      .then((_) {
                    Get.toNamed(RouteName.kVerfiyYourEmail);
                  });
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
            const SizedBox(
              height: HightManger.H30,
            ),
          ],
        ));
  }
}
