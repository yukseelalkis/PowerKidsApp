import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:flutter_application_1/language/laguage.dart';
import 'package:flutter_application_1/screens/admin_screen/admin_screen.dart';
import 'package:flutter_application_1/screens/login_screen/login_screen.dart/login_screen.dart';
import 'package:flutter_application_1/screens/login_screen/widget/login_widget.dart';

class LoginButton extends StatelessWidget {
  static String routeName = 'LoginButton';

  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          pngContainer(name: "main.png"),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: ProjectEdgeInsets().projectButtonTop,
                  child: CustomRow(
                    title: LanguageItems.teacherTitle,
                    icon: Icons.account_circle_outlined,
                    color: kPrimaryColor,
                    page: Container(),
                  ),
                ),
                Padding(
                  padding: ProjectEdgeInsets().projectButtonTop,
                  child: CustomRow(
                    title: LanguageItems.parentTitle, 
                    icon: Icons.account_circle_outlined,
                    color: kButtonBlueColor, 
                    page: LoginScreen(),
                  ),
                ),
                Padding(
                  padding: ProjectEdgeInsets().projectButtonTop,
                  child: CustomRow(
                    title: LanguageItems.adminTitle, 
                    icon: Icons.manage_accounts_outlined,
                    color: kButtonGreenColor, 
                    page: AdminScreen(),
                  ),
                ),
              ],
            ),
          ),
          pngContainer(name: "main_button.png"),
        ],
      ),
    );
  }
}
