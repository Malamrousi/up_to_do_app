import 'package:flutter/material.dart';
//constant
import '../../../../constant/image_manger.dart';
import '../../../../constant/size_manger.dart';
import '../../../../constant/string_manger.dart';
import '../../../widgets/social_auth_button.dart';

class RegisterSocialAuth extends StatelessWidget {
  const RegisterSocialAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
