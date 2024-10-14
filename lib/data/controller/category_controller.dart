import 'package:get/get.dart';
import 'package:todo_app/data/firebase/data_base_services.dart';
import 'package:todo_app/data/models/category_model.dart';

class CategoryController extends GetxController {
  final categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetchCategories();
  }
  // fetch categories

  void fetchCategories() {
    DataBaseServices.getCategoryCollection().snapshots().listen((snapshot) {
      categories.value = snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  //add categories

  Future<void> addCategories(CategoryModel category) async {
    await DataBaseServices().addCategory(categoryModel: category);
  }

  Future<CategoryModel?> getCategory(String categoryId) async {
    return await DataBaseServices().getCategory(categoryId: categoryId);
  }}
