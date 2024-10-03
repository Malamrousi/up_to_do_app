import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/data/models/user_model.dart';


class DataBaseServices {
  final String userCollection = 'Users';
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  DataBaseServices();

  void createUserFireStore(UserModel user, User firebaseUser) {
    _db.doc('$userCollection/${firebaseUser.uid}').set(
      user.toJson(),
    );

  }


  
}