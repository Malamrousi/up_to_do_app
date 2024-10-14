//PACKAGE
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//CONSTANT
import 'package:todo_app/core/utils/route_name.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app/core/utils/color_manger.dart';
//models
import 'package:todo_app/data/models/user_model.dart';
//helpers
import '../helpers/auth_exception_handler.dart';
//firebase

class AuthContoller extends GetxController {
  static AuthContoller to = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  final String userCollection = 'Users';
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Rx<User?> firebaseUser = Rx<User?>(null);
  RxBool isLoading = false.obs;
  final String UserCollection = 'Users';
  @override
  void onReady() {
    super.onReady();

    firebaseUser.bindStream(auth.authStateChanges());
        ever(firebaseUser, _handleAuthChanged);


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
      Get.offAllNamed(RouteName.kIndexScreen);
    }
  }

  //user state
  Stream<User?> get user => auth.authStateChanges();

  signInWithEmailAndPassword(BuildContext context) async {
    try {
      isLoading.value = true;
      await auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      emailController.clear();
      passwordController.clear();
    } on FirebaseAuthException catch (e) {
      var authStatus = AuthExceptionHandler.handleException(e);
      var errorMessage =
          AuthExceptionHandler.generateExceptionMessage(authStatus);

      SnackBar(errorMessage);
    } finally {
      isLoading.value = false;
    }
  }

  registerWithEmailAndPassword(BuildContext context) async {
    try {
      isLoading.value = true;

      await auth
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((result) {
        UserModel newUser = UserModel(
            name: nameController.text,
            email: result.user!.email!,
            uid: result.user!.uid);

        createUserFireStore(newUser, result.user!);
      });
    } on FirebaseAuthException catch (e) {
      var authStatus = AuthExceptionHandler.handleException(e);
      var errorMessage =
          AuthExceptionHandler.generateExceptionMessage(authStatus);

      SnackBar(errorMessage);
    } finally {
      isLoading.value = false;
    }
  }

  Future signInWithGoogle() async {
          isLoading.value = true;

    try {
          isLoading.value = true;

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
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

      UserModel newUser = UserModel(
        name: result.user?.displayName ?? 'No Name',
        email: result.user?.email ?? 'No Email',
        uid: result.user!.uid,
      );

      createUserFireStore(newUser, result.user!);
    } catch (e) {
      SnackBar(e);
    } finally {
      isLoading.value = false;
    }
  }

  //sign with facebook
  Future signInWithFacebook() async {
    try {
      isLoading.value = true;

      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.cancelled) {
        return;
      }

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      final UserCredential result = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      final userData = await FacebookAuth.instance.getUserData();

      UserModel newUser = UserModel(
        name: result.user?.displayName ?? userData['name'] ?? 'No name',
        email: result.user?.email ?? userData['email'] ?? 'No Email',
        uid: result.user!.uid,
      );

      createUserFireStore(newUser, result.user!);
    } catch (e) {
      SnackBar(e);
    } finally {
      isLoading.value = false;
    }
  }

  void SnackBar(Object e) {
    Get.snackbar('Error', 'Failed to sign  $e',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: ColorManger.kWhiteColor);
  }

  void createUserFireStore(UserModel user, User firebaseUser) {
    _db.doc('$userCollection/${firebaseUser.uid}').set(
          user.toJson(),
        );
  }

  Future<void> signOut() async {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    await GoogleSignIn().signOut();
    await auth.signOut();
    await FacebookAuth.instance.logOut();
    Get.offAllNamed(RouteName.kStartScreen);
  }
}
