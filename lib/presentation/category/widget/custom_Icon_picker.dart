import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/color_manger.dart';
import 'package:todo_app/services/icon_picker.dart';

class CustomIconPicker extends StatefulWidget {
  const CustomIconPicker({super.key, required this.onIconPicked});

  final void Function(IconData icon) onIconPicked;

  @override
  State<CustomIconPicker> createState() => _CustomIconPickerState();
}

class _CustomIconPickerState extends State<CustomIconPicker> {
  IconData? _selectedIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final IconData? result = await showIconPicker(
          context: context,
          defaultIcon: _selectedIcon,
        );

        if (result != null) {
          setState(() {
            _selectedIcon = result;
          });
        }
        widget.onIconPicked(_selectedIcon!);
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
