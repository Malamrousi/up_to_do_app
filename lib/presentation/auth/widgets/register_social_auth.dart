import 'package:flutter/material.dart';
import 'package:get/get.dart';
//constant
import '../../../core/utils/image_manger.dart';
import '../../../core/utils/size_manger.dart';
import '../../../core/utils/string_manger.dart';
import '../../../data/controller/auth_contoller.dart';
import 'social_auth_button.dart';

class RegisterSocialAuth extends StatelessWidget {
  const RegisterSocialAuth({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();

    return GetBuilder<AuthController>(builder: (contoller) {
      if (authController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Column(
          children: [
            SocialAuthButton(
              image: ImageManger.kGoogle,
              title: StringManger.kRegisterWithGoogle,
              onPressed: () async {
                await authController.signInWithGoogle();
              },
            ),
            const SizedBox(
              height: HightManger.H30,
            ),
            SocialAuthButton(
              image: ImageManger.kFacebook,
              title: StringManger.kRegisterWithFacebook,
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
