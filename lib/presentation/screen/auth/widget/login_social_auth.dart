//packge
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//constant
import 'package:todo_app/constant/string_manger.dart';
import 'package:todo_app/constant/size_manger.dart';
import 'package:todo_app/constant/image_manger.dart';
import 'package:todo_app/data/controller/auth_contoller.dart';

//widget
import '../../../widgets/social_auth_button.dart';

class LoginSocialAuth extends StatefulWidget {
  const LoginSocialAuth({super.key});

  @override
  State<LoginSocialAuth> createState() => _LoginSocialAuthState();
}

class _LoginSocialAuthState extends State<LoginSocialAuth> {
  @override
  Widget build(BuildContext context) {
    AuthContoller authController = Get.find<AuthContoller>();

    return GetBuilder<AuthContoller>(builder: (contoller) {
      if (authController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Column(
          children: [
            SocialAuthButton(
              image: ImageManger.Kgoogle,
              title: StringManger.KLoginwithGoogle,
              onPressed: () async {
                await authController.signInWithGoogle();
              },
            ),
            const SizedBox(
              height: HightManger.H30,
            ),
            SocialAuthButton(
              image: ImageManger.Kfacebook,
              title: StringManger.KLoginwithFacebook,
              onPressed: () async {
                await authController.signInWithFacebook();
              },
            ),
          ],
        );
      }
    });
  }
}
