import 'package:flutter/material.dart';
import 'package:flutter_application_1/deneme.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/screens/activity_screen/activity_screen.dart';
import 'package:flutter_application_1/screens/daily_flow_screen/daily_flow_screen.dart';
import 'package:flutter_application_1/screens/data_sheet_screen/data/data_sheet.dart';
import 'package:flutter_application_1/screens/data_sheet_screen/data_sheet_screen.dart';
import 'package:flutter_application_1/screens/fee_screen/fee_screen.dart';
import 'package:flutter_application_1/screens/home_screen/home_screen.dart';
import 'package:flutter_application_1/screens/login_screen/login_screen.dart/login_screen.dart';
import 'package:flutter_application_1/screens/menu_screen/menu_screen.dart';
import 'package:flutter_application_1/screens/splash_screen/splash_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, device) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
          primarySwatch: Colors.orange,
          useMaterial3: true,
        ),
        initialRoute: SplashScreen.routeName,
        routes: routes,
        darkTheme: ThemeData.dark().copyWith(),
        home: SplashScreen(),
      );
    });
  }
}
