import 'package:flutter/material.dart';
//constant
import '../../../../constant/color_manger.dart';
import '../../../../constant/size_manger.dart';
import '../../../../constant/string_manger.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: <Widget>[
      Expanded(
          child: Divider(
        color: ColorManger.KDividerColor,
      )),
      Text(
        StringManger.Kor,
        style: TextStyle(
            color: ColorManger.KDividerColor, fontSize: FontSizeValue.Fv16),
      ),
      Expanded(
          child: Divider(
        color: ColorManger.KDividerColor,
      )),
    ]);
  }
}
