import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/screens/splash_screen/splash_screen.dart';
import 'package:flutter_application_1/services/auth/auth_gate.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
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
        home: AuthGate(),
      );
    });
  }
}
