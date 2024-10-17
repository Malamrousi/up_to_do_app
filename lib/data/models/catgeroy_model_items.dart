// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../core/utils/image_manger.dart';

class CategoryModelItem {
  final String name;
  final Color color;
  final String image;
  CategoryModelItem({
    required this.name,
    required this.color,
    required this.image,
  });

  static List<CategoryModelItem> categoryModel = [
    CategoryModelItem(name: 'Grocery', color: const Color(0XFFCCFF80), image: ImageManger.kGrocery),
    CategoryModelItem(name: 'Work', color: const Color(0XFFFF9680), image: ImageManger.kWork),
    CategoryModelItem(name: 'sport', color: const Color(0XFF80FFFF), image: ImageManger.kSport),
    CategoryModelItem(name: 'Design', color: const Color(0XFF80FFD9), image: ImageManger.kDesign),
    CategoryModelItem(name: 'University', color: const Color(0XFF809CFF), image: ImageManger.kUniversity),
    CategoryModelItem(name: 'Social', color: const Color(0XFFFF80EB), image: ImageManger.kSocial),
    CategoryModelItem(name: 'Music', color: const Color(0XFFFF80EB), image: ImageManger.kMusic),
    CategoryModelItem(name: 'Health', color: const Color(0XFF80FFA3), image: ImageManger.kHealth),
    CategoryModelItem(name: 'Movie', color: const Color(0XFF80D1FF), image: ImageManger.kMovie),
    CategoryModelItem(name: 'Home', color: const Color(0XFFFFCC80), image: ImageManger.kCatHome),
  ];
}
