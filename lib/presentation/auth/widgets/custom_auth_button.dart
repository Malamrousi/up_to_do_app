//package
import 'package:flutter/material.dart';
//constant
import '../../../core/utils/size_manger.dart';
import 'package:todo_app/core/utils/color_manger.dart';

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
          color: color, border: Border.all(color: ColorManger.kHeliotrop)),
      child: MaterialButton(
        
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            color: ColorManger.kWhiteColor,
            fontSize: FontSizeValue.Fv16,
          ),
        ),
      ),
    );
  }
}
