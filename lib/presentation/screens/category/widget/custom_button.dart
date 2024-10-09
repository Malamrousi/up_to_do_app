import 'package:flutter/material.dart';
import '../../../../constant/size_manger.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.color,
    required this.title,
    required this.TextColor, 
  });

  final VoidCallback? onPressed;

  final Color? color;

  final String title;

  final Color TextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 153,
      height: 48,
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
