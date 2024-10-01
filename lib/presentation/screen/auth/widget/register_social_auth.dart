import 'package:flutter/material.dart';
import 'package:get/get.dart';
//constant
import '../../../../constant/image_manger.dart';
import '../../../../constant/size_manger.dart';
import '../../../../constant/string_manger.dart';
import '../../../../data/controller/auth_contoller.dart';
import '../../../widgets/social_auth_button.dart';

class RegisterSocialAuth extends StatelessWidget {
  const RegisterSocialAuth({super.key});

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
