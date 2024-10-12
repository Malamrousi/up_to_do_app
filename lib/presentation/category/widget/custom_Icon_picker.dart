import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/color_manger.dart';
import 'package:todo_app/services/icon_picker.dart';

class IconPicker extends StatefulWidget {
  const IconPicker({super.key});

  @override
  State<IconPicker> createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
  IconData? _selectedIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final IconData? result = await showIconPicker(
          context: context, 
          defalutIcon: _selectedIcon,
        );
        setState(() {
          _selectedIcon = result;
        });
      },
      child: Container(
        width: _selectedIcon == null ? 154 : 48,
        height: _selectedIcon == null ? 37 : 48,
        decoration: BoxDecoration(
          color: ColorManger.kEmperor,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: _selectedIcon == null
              ? const Text(
                  'Choose icon from library',
                  style: TextStyle(
                    color: ColorManger.kWhiteColor,
                    fontSize: 12,
                  ),
                )
              : Icon(
                  _selectedIcon,
                  color: ColorManger.kWhiteColor,
                  size: 24,
                ),
        ),
      ),
    );
  }
}
