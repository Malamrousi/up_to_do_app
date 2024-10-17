import 'package:get/get.dart';
import 'package:todo_app/data/controller/auth_contoller.dart';
import 'package:todo_app/data/controller/category_controller.dart';
import 'package:todo_app/data/controller/task_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(CategoryController());
    Get.put(TaskController());
  }
}
