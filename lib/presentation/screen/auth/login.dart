//packge
import 'package:flutter/material.dart';

//constant
import 'package:todo_app/data/services/validator.dart';
//widget
import '../../widgets/custom_app_bar.dart';
import 'widget/login_view_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Validator validator = Validator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const LoginViewBody(),
    );
  }
}
