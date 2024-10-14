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
  final List<Color> categoryColor = const [
    Color(0xBFC9CC41),
    Color(0xBF66CC41),
    Color(0xBF41CCA7),
    Color(0xBF4181CC),
    Color(0xBF41A2CC),
    Color(0xBFCC8441),
    Color(0xBF9741CC),
    Color(0xBFCC4173),
    Color(0xBF80FFFF),
    Color(0xBF80FFD9),
    Color(0xBF809CFF),
    Color(0xBFFF80EB),
    Color(0xBF80FFA3),
    Color(0xBF80D1FF),
    Color(0xBFFFFCC8),
  ];

  Color selectedColor = const Color(0xBFCCFF80);

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
            children: List.generate(categoryColor.length, (index) {
              final color = categoryColor[index];

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
