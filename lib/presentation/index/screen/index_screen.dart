import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/color_manger.dart';
import '../widget/add_task_bottom_sheet.dart';
import '../widget/custom_botton_navigation_bar.dart';
import '../widget/index_view_body.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _selectedIndex = 0;

  // Pages corresponding to each \
  static final List<Widget> _pages = <Widget>[
    const IndexViewBody(),
    const Center(
        child: Text(
      'Calendar Page',
      style: TextStyle(color: Colors.white, fontSize: 30),
    )),
    const Center(
        child: Text(
      'Focus Page',
      style: TextStyle(color: Colors.white, fontSize: 30),
    )),
    const Center(
        child: Text(
      'Profile Page',
      style: TextStyle(color: Colors.white, fontSize: 30),
    )),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            backgroundColor: ColorManger.kMineshaft,
           const AddTaskBottomSheet()
          );
        },
        tooltip: 'Add Task',
        backgroundColor: ColorManger.kHeliotrop,
        elevation: 1,
        child: const Icon(
          Icons.add,
          color: ColorManger.kWhiteColor,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
