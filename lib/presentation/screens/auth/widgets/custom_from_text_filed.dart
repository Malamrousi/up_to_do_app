import 'package:flutter/material.dart';
import '../../../../constant/color_manger.dart';
import '../../../../constant/size_manger.dart';

class CustomFromTextFiled extends StatefulWidget {
  const CustomFromTextFiled(
      {super.key,
      required this.onSaved,
      required this.validator,
      required this.label,
      required this.obscureText,
      required this.hintText,
      required this.keyboardType,
      required this.controller});

  final Function(String) onSaved;
  final String? Function(String?) validator;
  final String hintText;
  final String label;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  _CustomFromTextFiledState createState() => _CustomFromTextFiledState();
}

class _CustomFromTextFiledState extends State<CustomFromTextFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,  // استخدم المتحكم المارر كمعامل
      keyboardType: widget.keyboardType,
      cursorColor: ColorManger.KHeliotrop,
      obscureText: widget.obscureText,
      style: const TextStyle(
        color: ColorManger.KWhiteColor,
      ),
      validator: widget.validator,
      onSaved: (value) => widget.onSaved(value!),
      decoration: InputDecoration(
        label: Text(widget.label),
        labelStyle: const TextStyle(
            color: ColorManger.KWhiteColor, fontSize: FontSizeValue.Fv16),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: ColorManger.KEmperor),
        filled: true,
        fillColor: ColorManger.KCodGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(BorderRadiusValue.BV10),
          borderSide: const BorderSide(
            color: ColorManger.KCodGray,
          ),
        ),
      ),
    );
  }
}
