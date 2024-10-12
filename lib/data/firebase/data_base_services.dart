import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/data/models/category_model.dart';
import 'package:todo_app/data/models/task_model.dart';

class DataBaseServices {
  static const String _userCollection = 'Users';
  static const String _taskCollection = 'Task';
  static const String _categoryCollection = 'Category';

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static late User _currentUser;

  // task collection

  static CollectionReference<TaskModel> getTaskCollection() {
    return _db
        .collection(_userCollection)
        .doc(_currentUser.uid)
        .collection(_taskCollection)
        .withConverter<TaskModel>(
            fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()),
            toFirestore: (task, _) => task.toJson());
  }

  // category collection

  static CollectionReference<CategoryModel> getCategoryCollection() {
    return _db
        .collection(_userCollection)
        .doc(_currentUser.uid)
        .collection(_categoryCollection)
        .withConverter(
            fromFirestore: (snapshot, _) =>
                CategoryModel.fromJson(snapshot.data()!),
            toFirestore: (category, _) => category.toJson());
  }

  //ad task
  Future<void> addTask({required TaskModel taskModel}) async {
    DocumentReference<TaskModel> docRef = getTaskCollection().doc();
    return await docRef.set(taskModel);
  }

  //get task
  Stream<TaskModel?> getTask({required String taskId}) {
    DocumentReference<TaskModel> docRef = getTaskCollection().doc(taskId);
    return docRef.snapshots().map((snapshot) => snapshot.data());
  }

  // add Category
  Future<void> addCategory({required CategoryModel categoryModel}) async {
    DocumentReference<CategoryModel> docRef = getCategoryCollection().doc();

    return await docRef.set(categoryModel);
  }

  // get Category
  Future<CategoryModel?> getCategory({required String categoryId}) async {
    DocumentSnapshot<CategoryModel> snapshot =
        await getCategoryCollection().doc(categoryId).get();
    return snapshot.data();
  }

  // update end time and is done

  Future<void> updateTaskStatus(
      {required String taskId, bool? isDone, DateTime? endTime}) async {
    DocumentReference<TaskModel> docRef = getTaskCollection().doc(taskId);
    Map<String, dynamic> updatedData = {};

    if (isDone != null) {
      updatedData['is_done'] = isDone;
    }
    if (endTime != null) {
      updatedData['endTime'] = DateTime.now();
    }
    return await docRef.update(updatedData);
  }
}
