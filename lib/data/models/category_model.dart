class CategoryModel {
  final String categoryName;
  final String image;
  final String color;

  CategoryModel({
    required this.categoryName,
    required this.image,
    required this.color,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> data) {
    return CategoryModel(
      categoryName: data['category_name'],
      image: data['image'],
      color: data['color'], 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_name': categoryName,
      'image': image,
      'color': color, 
    };
  }
}
