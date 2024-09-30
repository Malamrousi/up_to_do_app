import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/constant/route_name.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController authenticationController = Get.find();

  FirebaseAuth auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;

  Future<void> createUser(
      String email, String password, String userName) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (user != null) {
  await user!.sendEmailVerification();
} else {
  Get.snackbar('Error', 'No user is currently signed in.');
}
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Weak Password', 'Please use a stronger password.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Email In Use', 'This email is already in use.');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'An unexpected error occurred.');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Future.delayed(Duration(milliseconds: 100), () {
          Get.snackbar('User Not Found', 'No user found for this email.');
        });
      } else if (e.code == 'wrong-password') {
        Future.delayed(Duration(milliseconds: 100), () {
          Get.snackbar('Wrong Password', 'Incorrect password provided.');
        });
      } else if (e.code == 'invalid-email') {
        Future.delayed(Duration(milliseconds: 100), () {
          Get.snackbar('Invalid Email', 'The email address is not valid.');
        });
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred during login.');
      print(e);
    }
  }

  void signOut() async {
    await auth.signOut().then((_) {
      Get.offAllNamed(RouteName.KStartScreen);
    });
    Get.snackbar('Logged Out', 'You have successfully logged out.');
  }
}
