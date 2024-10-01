import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/presentation/screen/home/screen/home_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(const Duration(minutes: 1));
      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      Get.snackbar(e.toString(), 'Error in verify');
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? const HomeScreen()
        : Scaffold(
            appBar: AppBar(
              title: const Text('Verify Email'),
            ),
            body: Padding(
                padding: const EdgeInsets.all(
                  30,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'A Verification has been send to this email',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50)),
                      icon: const Icon(
                        Icons.email,
                        size: 32,
                      ),
                      label: const Text('Resent Email'),
                      onPressed: sendVerificationEmail,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: FirebaseAuth.instance.signOut,
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontSize: 24),
                        ))
                  ],
                )),
          );
  }
}
