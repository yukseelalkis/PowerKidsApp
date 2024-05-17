/*
TELFON NUMARASI E MAIL OLARAK AYARLADIK ONU SADECE TELEFON OLARAK DEGISTIRMEM LAZIM
*/

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:flutter_application_1/language/laguage.dart';
import 'package:flutter_application_1/screens/home_screen/home_screen.dart';
import 'package:flutter_application_1/screens/login_screen/widget/login_widget.dart';

late bool _passwordVisible;

class LoginScreen extends StatefulWidget {
  static String routeName = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  //changes current state
  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //when user taps anywhere on the screen, keyboard hides
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  //width: 100.w,
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
                      buildEmailField(),
                      SizedBox(
                        height: ProjectSize().login2xSizedBoxHeigth,
                      ),
                      buildPasswordField(),
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

  TextFormField buildEmailField() {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: kInputTextStyle,
      decoration: InputDecoration(
        labelText: LanguageItems.phoneLabelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        RegExp regExp = new RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return LanguageItems.MailPls;
        } else if (!regExp.hasMatch(value)) {
          return LanguageItems.errorMail;
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: kInputTextStyle,
      decoration: InputDecoration(
        labelText: LanguageItems.password,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(
            _passwordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_off_outlined,
          ),
          iconSize: kDefaultPadding,
        ),
      ),
      validator: (value) {
        if (value!.length < 5) {
          return LanguageItems.errorPassword;
        }
        return null;
      },
    );
  }
}
