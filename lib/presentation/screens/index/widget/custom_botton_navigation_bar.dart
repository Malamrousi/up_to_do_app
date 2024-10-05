import 'package:flutter/material.dart';
import 'package:todo_app/constant/color_manger.dart';
import '../../../../data/models/botton_navigation_bar_item.dart';

class CustomBottonNavigationBar extends StatefulWidget {
  final Function(int) onItemTapped;
  final int selectedIndex;

  const CustomBottonNavigationBar({
    super.key,
    required this.onItemTapped,
    required this.selectedIndex,
  });

  @override
  State<CustomBottonNavigationBar> createState() =>
      _CustomBottonNavigationBarState();
}

class _CustomBottonNavigationBarState extends State<CustomBottonNavigationBar> {
  final List<BottonNavigationBarItems> _items = [
    BottonNavigationBarItems(icon: Icons.home_filled, label: 'Index'),
    BottonNavigationBarItems(
        icon: Icons.calendar_month_outlined, label: 'Calendar'),
    BottonNavigationBarItems(icon: Icons.access_time_sharp, label: 'Focus'),
    BottonNavigationBarItems(icon: Icons.person_outline, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: ColorManger.kMineshaft,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Spacing between items
        children: _items.map((item) {
          int index = _items.indexOf(item);
          return GestureDetector(
            onTap: () => widget.onItemTapped(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item.icon,
                  color: widget.selectedIndex == index
                      ? Colors.white
                      : Colors.grey,
                ),
                Text(
                  item.label,
                  style: TextStyle(
                    color: widget.selectedIndex == index
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

