import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/firebase/data_base_services.dart';
import 'package:todo_app/data/models/task_model.dart';

class TaskController extends GetxController {
  var tasks = <TaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTask();
  } //fetchTask
 
   void fetchTask() {
     DataBaseServices.getTaskCollection().snapshots().listen((snapshot) {
       tasks.value = snapshot.docs.map((doc) => doc.data()).toList();
     });
   }


Future<void> updateTaskStatus({

  bool? iSDone,
  DateTime? endTime,
}) async {
  await DataBaseServices().updateTaskStatus(
  
    isDone: iSDone,
    endTime: endTime,
  );
}

  //addTask

  Future<void> addTask(TaskModel task) async {
    await DataBaseServices().addTask(taskModel: task);
  }

  //

  Stream<TaskModel?> getTask(String taskId) {
    return DataBaseServices().getTask(taskId: taskId);
  }
}
