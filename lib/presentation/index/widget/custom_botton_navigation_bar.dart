import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/color_manger.dart';
import '../../../data/models/botton_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onItemTapped;
  final int selectedIndex;

  const CustomBottomNavigationBar({
    super.key,
    required this.onItemTapped,
    required this.selectedIndex,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final List<BottoMNavigationBarItems> _items = [
    BottoMNavigationBarItems(icon: Icons.home_filled, label: 'Index'),
    BottoMNavigationBarItems(
        icon: Icons.calendar_month_outlined, label: 'Calendar'),
    BottoMNavigationBarItems(icon: Icons.access_time_sharp, label: 'Focus'),
    BottoMNavigationBarItems(icon: Icons.person_outline, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: ColorManger.kMineshaft,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, 
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

