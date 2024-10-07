import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/data/models/category_model.dart';
import 'package:todo_app/data/models/task_model.dart';

class DataBaseServices {
  static const String userCollection = 'Users';
  static const String taskCollection = 'Task';
  static const String CategoryCollection = 'Category';
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static CollectionReference<TaskModel> getTaskCollection(User firebaseUser) {
    return _db
        .collection(userCollection)
        .doc(firebaseUser.uid)
        .collection(taskCollection)
        .withConverter<TaskModel>(
            fromFirestore: (snapshot, _) =>
                TaskModel.fromJson(snapshot.data()!),
            toFirestore: (task, _) => task.toJson());
  }

  Future<void> addTask(
    TaskModel taskModel,
    User firebaseUser,
  ) async {
    var docRef = getTaskCollection(firebaseUser).doc();
    return docRef.set(taskModel);
  }

  //deleteTask
  Future<void> deleteTask(User firebaseUser, String docId) async {
    await getTaskCollection(firebaseUser).doc(docId).delete();
  }

  static CollectionReference<CategoryModel> getCategoryCollection(
      User firebaseUser) {
    return _db
        .collection(userCollection)
        .doc(firebaseUser.uid)
        .collection(CategoryCollection)
        .withConverter(
            fromFirestore: (snapshot, _) =>
                CategoryModel.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson());
  }

  Future<void> addCategory(
    CategoryModel categoryModel,
    User firebaseUser,
  ) async {
    var docRef = getCategoryCollection(firebaseUser).doc();
    return docRef.set(categoryModel);
  }
}
