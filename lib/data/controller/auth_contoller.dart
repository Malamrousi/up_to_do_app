//PACKAGE
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//CONSTANT
import 'package:todo_app/constant/route_name.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app/constant/color_manger.dart';
//models
import 'package:todo_app/data/models/user_model.dart';
//helpers
import '../helpers/auth_exception_handler.dart';

class AuthContoller extends GetxController {
  static AuthContoller to = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Rx<User?> firebaseUser = Rx<User?>(null);
  final String UserCollection = 'Users';
  @override
  void onReady() {
    ever(firebaseUser, _handleAuthChanged);

    firebaseUser.bindStream(user);

    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void _handleAuthChanged(User? user) {
    if (user != null) {
      Get.offAllNamed(RouteName.kHomeScreen);
    }
  }

  //user state
  Stream<User?> get user => auth.authStateChanges();

  signInWithEmailAndPassword(BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      emailController.clear();
      passwordController.clear();
    } on FirebaseAuthException catch (e) {
      var authStatus = AuthExceptionHandler.handleException(e);
      var errorMessage =
          AuthExceptionHandler.generateExceptionMessage(authStatus);

      Get.snackbar('Error', errorMessage,
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: ColorManger.KWhiteColor);
    }
  }

  registerWithEmailAndPassword(BuildContext contex) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((result) {
        UserModel _newUser = UserModel(
            name: nameController.text,
            email: result.user!.email!,
            uid: result.user!.uid);

        _createUserFireStore(_newUser, result.user!);
      });
    } on FirebaseAuthException catch (e) {
      var authStatus = AuthExceptionHandler.handleException(e);
      var errorMessage =
          AuthExceptionHandler.generateExceptionMessage(authStatus);

      Get.snackbar('auth.signUpErrorTitle', errorMessage,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        Get.snackbar('Sign In', 'Login cancelled by user.',
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 3),
            backgroundColor: Get.theme.snackBarTheme.backgroundColor,
            colorText: ColorManger.KWhiteColor);
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential result =
          await FirebaseAuth.instance.signInWithCredential(credential);

      UserModel _newUser = UserModel(
        name: result.user?.displayName ?? 'No Name',
        email: result.user?.email ?? 'No Email',
        uid: result.user!.uid,
      );

      _createUserFireStore(_newUser, result.user!);
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'Failed to sign in with Google: $e',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 3),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  void _createUserFireStore(UserModel user, User firebaseuser) {
    _db.doc('$UserCollection/${firebaseuser.uid}').set(user.toJson());
    update();
  }

  Future<void> signOut() async {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    await GoogleSignIn().signOut();
    await auth.signOut();
    Get.offAllNamed(RouteName.KStartScreen);
  }
}
