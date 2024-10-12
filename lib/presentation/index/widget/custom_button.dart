//package
import 'package:flutter/material.dart';
//constant
import '../../../core/utils/size_manger.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.color,
    required this.title,
    required this.TextColor, required this.width, required this.hight,
  });

  final VoidCallback? onPressed;

  final Color? color;

  final String title;

  final Color TextColor;

  final double width;
  final double hight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: TextColor,
            fontSize: FontSizeValue.Fv16,
          ),
        ),
      ),
    );
  }
}
