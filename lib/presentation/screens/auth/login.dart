//packge
import 'package:flutter/material.dart';

//constant
//widget
import 'widgets/custom_app_bar.dart';
import 'widgets/login_view_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const LoginViewBody(),
    );
  }
}
