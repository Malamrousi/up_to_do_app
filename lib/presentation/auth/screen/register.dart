//package
import 'package:flutter/material.dart';
//widget
import '../widgets/custom_app_bar.dart';
import '../widgets/register_view_body.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body:const RegisterViewBody() ,
    );
  }
}
