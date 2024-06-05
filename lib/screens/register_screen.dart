import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_textField.dart';
import 'package:flutter_application_1/services/auth/auth_services.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onTap;

  // login fonskitonu

  void register(BuildContext context) async {
    final authServices = AuthServices();
    authServices.signInWithEmailPasswordRegister(
        _mailController.text, _passwordController.text);
  }

  RegisterPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.message_outlined,
            size: 60,
          ),
          const SizedBox(height: 50),
          const Text(
            "Welcome  back , you've been missed!",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          const SizedBox(height: 50),
          MyTextField(
            hintText: "E-mail",
            obscureText: false,
            controller: _mailController,
          ),
          const SizedBox(height: 10),
          MyTextField(
            hintText: "Password",
            obscureText: true,
            controller: _passwordController,
          ),
          const SizedBox(height: 10),
          MyButton(
            textTitle: "Register",
            onTap: () => register(context),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Not a member",
                style: TextStyle(color: Colors.grey),
              ),
              GestureDetector(
                onTap: onTap,
                child: const Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
