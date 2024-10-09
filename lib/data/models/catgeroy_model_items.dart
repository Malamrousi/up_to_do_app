// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../constant/image_manger.dart';

class CatgeroyModel {
  final String name;
  final Color color;
  final String image;
  CatgeroyModel({
    required this.name,
    required this.color,
    required this.image,
  });

  static List<CatgeroyModel> catgeroyModel = [
    CatgeroyModel(name: 'Grocery', color: const Color(0XFFCCFF80), image: ImageManger.kGrocery),
    CatgeroyModel(name: 'Work', color: const Color(0XFFFF9680), image: ImageManger.KWork),
    CatgeroyModel(name: 'sport', color: const Color(0XFF80FFFF), image: ImageManger.kSport),
    CatgeroyModel(name: 'Design', color: const Color(0XFF80FFD9), image: ImageManger.kDesign),
    CatgeroyModel(name: 'University', color: const Color(0XFF809CFF), image: ImageManger.kUniversity),
    CatgeroyModel(name: 'Social', color: const Color(0XFFFF80EB), image: ImageManger.kSocial),
    CatgeroyModel(name: 'Music', color: const Color(0XFFFF80EB), image: ImageManger.kMusic),
    CatgeroyModel(name: 'Health', color: const Color(0XFF80FFA3), image: ImageManger.KHealth),
    CatgeroyModel(name: 'Movie', color: const Color(0XFF80D1FF), image: ImageManger.KMovie),
    CatgeroyModel(name: 'Home', color: const Color(0XFFFFCC80), image: ImageManger.KHome),
  ];
}
