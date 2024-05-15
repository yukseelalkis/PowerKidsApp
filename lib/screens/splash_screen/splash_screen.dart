// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screens/login_screen/login_screen.dart/login_button.dart';
// import 'package:sizer/sizer.dart';

// class SplashScreen extends StatefulWidget {
//   static String routeName = 'SplashScreen';

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 5), () {
//       Navigator.pushNamedAndRemoveUntil(
//           context, LoginButton.routeName, (route) => false);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Final', style: Theme.of(context).textTheme.headlineSmall),
//                 Text('Project',
//                     style: Theme.of(context).textTheme.headlineSmall),
//               ],
//             ),
//             Image.asset(
//               'assets/images/main.png',
//               //25% of height & 50% of width
//               height: 25.h,
//               width: 50.w,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:flutter_application_1/language/laguage.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/screens/login_screen/login_screen.dart/login_button.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(projectDuration, () {
      ProjectRouteScreen().navigateToDailyFlowScreen(context, LoginButton());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(LanguageItems.splashTitleFinal,
                    style: Theme.of(context).textTheme.headlineSmall),
                Text(LanguageItems.splashTitleProject,
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
            PngImages(
              name: "main.png",
            )
          ],
        ),
      ),
    );
  }
}
