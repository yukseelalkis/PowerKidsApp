/*
TELFON NUMARASI E MAIL OLARAK AYARLADIK ONU SADECE TELEFON OLARAK DEGISTIRMEM LAZIM
*/

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/components/my_textField.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:flutter_application_1/language/laguage.dart';
import 'package:flutter_application_1/screens/home_screen/home_screen.dart';
import 'package:flutter_application_1/screens/login_screen/widget/login_widget.dart';
import 'package:flutter_application_1/services/auth/auth_services.dart';

late bool _passwordVisible;

class LoginScreen extends StatefulWidget {
  static String routeName = 'LoginScreen';
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onTap;
  LoginScreen({this.onTap});

  void login(BuildContext context) async {
    final authServices = AuthServices();
    try {
      await authServices.signInWithEmailPassword(
          _mailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: ProjectSize().projecContainerWidth,
                  height: ProjectSize().projectImageContainerHeight,
                  decoration:
                      ProjectDecoration().boxDecorationImage("main.png")),
              Container(
                color: kTextWhiteColor,
                padding: ProjectEdgeInsets().edgeInsetsLogin,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: ProjectSize().login2xSizedBoxHeigth,
                      ),
                      MyTextField(
                        hintText: "E-mail",
                        obscureText: false,
                        controller: widget._mailController,
                      ),
                      SizedBox(
                        height: ProjectSize().login2xSizedBoxHeigth,
                      ),
                      MyTextField(
                        hintText: "Password",
                        obscureText: true,
                        controller: widget._passwordController,
                      ),
                      SizedBox(
                        height: ProjectSize().login2xSizedBoxHeigth,
                      ),
                      TextButton(
                        child: Padding(
                          padding: ProjectEdgeInsets().projectLoginButtonLeft,
                          child: Row(
                            children: [
                              Icon(
                                Icons.done,
                                color: kTextLightColor,
                              ),
                              Text(LanguageItems.kvkkTitle,
                                  style: TextStyle(color: kTextLightColor)),
                            ],
                          ),
                        ),
                        onPressed: () {},
                      ),
                      DefaultButton(
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamedAndRemoveUntil(context,
                                HomeScreen.routeName, (route) => false);
                          }
                        },
                        title: LanguageItems.loginTitle,
                        iconData: Icons.arrow_forward_outlined,
                      ),
                      SizedBox(
                        height: ProjectSize().login2xSizedBoxHeigth,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            LanguageItems.forgetPassword,
                            textAlign: TextAlign.end,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              pngContainer(name: "main_button.png")
            ],
          ),
        ),
      ),
    );
  }
}
