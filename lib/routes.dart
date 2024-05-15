import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen/home_screen.dart';
import 'package:flutter_application_1/screens/login_screen/login_screen.dart/login_button.dart';
import 'package:flutter_application_1/screens/login_screen/login_screen.dart/login_screen.dart';
import 'package:flutter_application_1/screens/splash_screen/splash_screen.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  LoginButton.routeName: (context) => LoginButton(),
};

class ProjectRouteScreen {
  void navigateToDailyFlowScreen(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}
