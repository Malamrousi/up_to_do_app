class CategoryModel {
  final String categoryName;
  final String icon;
  final String color;

  CategoryModel({
    required this.categoryName,
    required this.icon,
    required this.color,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> data) {
    return CategoryModel(
      categoryName: data['category_name'],
      icon: data['icon'],
      color: data['color'], 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_name': categoryName,
      'image': icon,
      'color': color, 
    };
  }
}
