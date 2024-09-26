//packge
import 'package:flutter/material.dart';

//constant
import 'package:todo_app/constant/string_manger.dart';
import 'package:todo_app/constant/size_manger.dart';
import 'package:todo_app/constant/image_manger.dart';



//widget
import '../../../widgets/social_auth_button.dart';

class LoginSocialAuth extends StatelessWidget {
  const LoginSocialAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialAuthButton(
          image: ImageManger.Kgoogle,
          title: StringManger.KLoginwithGoogle,
          onPressed: () {},
        ),
        const SizedBox(
          height: HightManger.H30,
        ),
        SocialAuthButton(
          image: ImageManger.Kfacebook,
          title: StringManger.KLoginwithFacebook,
          onPressed: () {},
        ),
      ],
    );
  }
}
