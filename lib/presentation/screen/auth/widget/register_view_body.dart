//packge
import 'package:flutter/material.dart';
import 'package:todo_app/constant/color_manger.dart';
import 'package:todo_app/constant/image_manger.dart';
import 'package:todo_app/constant/size_manger.dart';
//constant
import 'package:todo_app/constant/string_manger.dart';
import 'package:todo_app/data/controller/validator.dart';

//widget
import '../../../widgets/custom_auth_button.dart';
import '../../../widgets/custom_from_text_filed.dart';
import '../../../widgets/social_auth_button.dart';
class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  @override
  Widget build(BuildContext context) {
     GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Validator validator = Validator();
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PaddingManger.P30),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
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
                    SocialAuthButton(
                      image: ImageManger.Kgoogle,
                      title: StringManger.KRegisterwithGoogle,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: HightManger.H30,
                    ),
                    SocialAuthButton(
                      image: ImageManger.Kfacebook,
                      title: StringManger.KRegisterwithFacebook,
                      onPressed: () {},
                    ),
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
                          onPressed: () {},
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
              ),
            ],
          ),
        ),
      );
  }
}