//package
import 'package:flutter/material.dart';
//constant
import '../../../../constant/size_manger.dart';
import 'package:todo_app/constant/color_manger.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton(
      {super.key, this.onPressed, this.color, required this.title, });

  final VoidCallback? onPressed;

  final Color? color;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: WidthManger.W327,
      height: HightManger.H48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BorderRadiusValue.BV10),
          color: color, border: Border.all(color: ColorManger.KHeliotrop)),
      child: MaterialButton(
        
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            color: ColorManger.KWhiteColor,
            fontSize: FontSizeValue.Fv16,
          ),
        ),
      ),
    );
  }
}
