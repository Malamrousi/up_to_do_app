import 'package:flutter/material.dart';
//constant
import '../../../core/utils/color_manger.dart';
import '../../../core/utils/size_manger.dart';
import '../../../core/utils/string_manger.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: <Widget>[
      Expanded(
          child: Divider(
        color: ColorManger.kDividerColor,
      )),
      Text(
        StringManger.kOr,
        style: TextStyle(
            color: ColorManger.kDividerColor, fontSize: FontSizeValue.Fv16),
      ),
      Expanded(
          child: Divider(
        color: ColorManger.kDividerColor,
      )),
    ]);
  }
}
