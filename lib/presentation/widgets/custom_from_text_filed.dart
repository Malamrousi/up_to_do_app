//package
import 'package:flutter/material.dart';
//constant
import '../../constant/color_manger.dart';
import '../../constant/size_manger.dart';

class CustomFromTextFiled extends StatelessWidget {
  const CustomFromTextFiled(
      {super.key,
      required this.onSaved,
      required this.validator,
      required this.label,
      required this.obscureText, 
      required this.hintText, required this.keyboardType});

  final Function(String) onSaved;
  final String? Function(String?) validator;
  final String hintText;
  final String label;
  final bool obscureText;

  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      
      cursorColor: ColorManger.KHeliotrop,
      obscureText: obscureText,
      style: const TextStyle(
        color: ColorManger.KWhiteColor,
      ),
      validator: validator,
      onSaved: (value) => onSaved(value!),
      decoration: InputDecoration(
        
        label: Text(label),
        labelStyle:const TextStyle(
          color: ColorManger.KWhiteColor,
          fontSize: FontSizeValue.Fv16
        ),
        hintText:hintText ,
        hintStyle:const TextStyle(
          color: ColorManger.KEmperor
        ),
          filled: true,
          fillColor: ColorManger.KCodGray,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(BorderRadiusValue.BV10),
            borderSide:const BorderSide(
              color: ColorManger.KCodGray,

            )
          )),
    );
  }
}
