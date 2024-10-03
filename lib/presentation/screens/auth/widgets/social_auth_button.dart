//package
import 'package:flutter/material.dart';
//constant
import '../../../../constant/color_manger.dart';
import '../../../../constant/size_manger.dart';


class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.image});
  final VoidCallback onPressed;

  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: WidthManger.W327,
      height: HightManger.H48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BorderRadiusValue.BV10),
          border: Border.all(color: ColorManger.KHeliotrop)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: WidthManger.W24,
              height: HightManger.H24,
            ),
             Text(
              title,
              style:const TextStyle(
                  color: ColorManger.KWhiteColor, fontSize: FontSizeValue.Fv16),
            ),
          ],
        ),
      ),
    );
  }
}
