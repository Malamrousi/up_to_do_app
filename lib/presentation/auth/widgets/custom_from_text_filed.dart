import 'package:flutter/material.dart';
import '../../../core/utils/color_manger.dart';
import '../../../core/utils/size_manger.dart';

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
      cursorColor: ColorManger.kHeliotrop,
      obscureText: widget.obscureText,
      style: const TextStyle(
        color: ColorManger.kWhiteColor,
      ),
      validator: widget.validator,
      onSaved: (value) => widget.onSaved(value!),
      decoration: InputDecoration(
        label: Text(widget.label),
        labelStyle: const TextStyle(
            color: ColorManger.kWhiteColor, fontSize: FontSizeValue.Fv16),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: ColorManger.kEmperor),
        filled: true,
        fillColor: ColorManger.kCodGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(BorderRadiusValue.BV10),
          borderSide: const BorderSide(
            color: ColorManger.kCodGray,
          ),
        ),
      ),
    );
  }
}
