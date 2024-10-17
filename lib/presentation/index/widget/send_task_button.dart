import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/color_manger.dart';

class SendTaskButton extends StatelessWidget {
  const SendTaskButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.send_outlined),
      color: ColorManger.kHeliotrop,
      iconSize: 24,
    );
  }
}
