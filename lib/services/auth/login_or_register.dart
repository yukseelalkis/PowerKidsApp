import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen/login_screen.dart/login_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  bool showLoginPage = true;

  void tooglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(
        onTap: tooglePages,
      );
    } else {
      return RegisterPage(onTap: tooglePages);
    }
  }
}
