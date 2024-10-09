import 'package:flutter/material.dart';
import 'package:todo_app/constant/color_manger.dart';

class SendTaskButton extends StatelessWidget {
  const SendTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){

    }, icon: Icon(Icons.send_outlined) ,
    color: ColorManger.KHeliotrop,
   iconSize: 24, );
  }
}