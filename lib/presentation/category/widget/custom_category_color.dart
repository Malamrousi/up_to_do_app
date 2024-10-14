import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/color_manger.dart';
import 'package:todo_app/core/utils/string_manger.dart';

class CustomCategoryColor extends StatefulWidget {
  const CustomCategoryColor({super.key, required this.colorPicked});

  final void Function(Color color) colorPicked;

  @override
  State<CustomCategoryColor> createState() => _CustomCategoryColorState();
}

class _CustomCategoryColorState extends State<CustomCategoryColor> {
  final List<Color> catgeroyColor = const [
    Color(0xffC9CC41),
    Color(0xff66CC41),
    Color(0xff41CCA7),
    Color(0xff4181CC),
    Color(0xff41A2CC),
    Color(0xffCC8441),
    Color(0xff9741CC),
    Color(0xffCC4173),
    Color(0xFF80FFFF),
    Color(0xFF80FFD9),
    Color(0xFF809CFF),
    Color(0xFFFF80EB),
    Color(0xFF80FFA3),
    Color(0xFF80D1FF),
    Color(0xFFFFCC80),
  ];

  Color selectedColor = const Color(0xFFCCFF80);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          StringManger.kCategoryColor,
          style: TextStyle(
            color: ColorManger.kWhiteColor,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal, // Enable horizontal scrolling
          child: Row(
            children: List.generate(catgeroyColor.length, (index) {
              final color = catgeroyColor[index];

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = color; // Update selected color on tap
                  });

                  widget.colorPicked(selectedColor);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8.0), // Space between circles
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selectedColor == color
                          ? Colors.white
                          : Colors.transparent,
                      width: 3.0, // Highlight selected color with border
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 20, // Size of the color circle
                    backgroundColor: color,
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
