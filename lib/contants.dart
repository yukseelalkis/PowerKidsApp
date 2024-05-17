import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

//colors
const Color kPrimaryColor = Colors.orange;
const Color kSecondaryColor = Colors.deepOrange;
const Color kTextBlackColor = Color(0xFF313131);
const Color kTextWhiteColor = Color(0xFFFFFFFF);
const Color kContainerColor = Color(0xFF777777);
const Color kOtherColor = Color(0xFFF4F6F7);
const Color kTextLightColor = Color(0xFFA5A5A5);
const Color kErrorBorderColor = Color(0xFFE74C3C);
const Color kButtonBlueColor = Colors.blue;
const Color kButtonGreenColor = Colors.green;
const Color kButtonYellowColor = Colors.yellow;
const Color kButtonRedColor = Colors.red;

//default value
const kDefaultPadding = 20.0;
final double maxPadding = 50;
final double defaultWidth = 150;
final double maxtWidth = 150;
final double defaultHeigth = 50;
final double maxHeigth = 200;
final double loginSizedBox = 10;

const sizedBox = SizedBox(
  height: kDefaultPadding,
);
const kWidthSizedBox = SizedBox(
  width: kDefaultPadding,
);

const kHalfSizedBox = SizedBox(
  height: kDefaultPadding / 2,
);

const kHalfWidthSizedBox = SizedBox(
  width: kDefaultPadding / 2,
);

final kTopBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
  topRight:
      Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
);

final kBottomBorderRadius = BorderRadius.only(
  bottomRight:
      Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
  bottomLeft:
      Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
);

final kInputTextStyle = GoogleFonts.poppins(
    color: kTextBlackColor, fontSize: 11.sp, fontWeight: FontWeight.w500);

//validation for mobile
const String mobilePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

//validation for email
const String emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

final Duration projectDuration = Duration(seconds: 5);

class PngImages extends StatelessWidget {
  const PngImages({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Image.asset(_nameWithPath);
  }

  String get _nameWithPath => 'assets/images/$name';
}

class ProjectAssetImage extends StatelessWidget {
  const ProjectAssetImage({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Image.asset(_nameWithPath);
  }

  String get _nameWithPath => 'assets/images/$name';
}

//EDGE INSETS
class ProjectEdgeInsets {
  final EdgeInsets edgeInsetsHomeOnly =
      const EdgeInsets.only(left: 22, top: 25);
  final EdgeInsets edgeInsetsHomeLast =
      const EdgeInsets.only(left: 15, top: 25);
  final EdgeInsets edgeInsetsLogin = EdgeInsets.only(left: 5.w, right: 5.w);
  final EdgeInsets edgeInsetsAll = EdgeInsets.all(kDefaultPadding);
  final EdgeInsets edgeInsetsHalfAll = EdgeInsets.all(kDefaultPadding / 2);
  final EdgeInsets marginLeftRight =
      EdgeInsets.only(left: kDefaultPadding / 2, right: kDefaultPadding / 2);

  final EdgeInsets projectContainerTop = EdgeInsets.only(top: maxPadding);
  final EdgeInsets projectActivityContainerBottom =
      EdgeInsets.only(bottom: kDefaultPadding);
  final EdgeInsets projectButtonTop = EdgeInsets.only(top: kDefaultPadding);
  final EdgeInsets projectButtonHalfTop =
      EdgeInsets.only(top: kDefaultPadding / 2);
  final EdgeInsets projectLoginButtonLeft = EdgeInsets.only(left: maxPadding);
}

//Sizes
class ProjectSize {
  final double projectLoginButtonRowWidth = defaultWidth;
  final double projectButtonRowHeight = defaultHeigth;
  final double addPhotoContainerWidth = maxtWidth;
  final double addPhotoContainerHeight = maxHeigth;
  final double feeHeight =
      SizerUtil.deviceType == DeviceType.tablet ? 8.h : 7.h;
  final double loginSizedBoxWidth = 10;
  final double login2xSizedBoxHeigth = (loginSizedBox * 2);
  final double elevationSize = 10;
  final double menuButton = 75;
  final double projecContainerWidth = 100.w;
  final double projectImageContainerHeight = 30.h;
  final double projectImageContainerHalfHeight = 15.h;
  final double defaultContainer = 26.sp;
  final double floatinContainerSize = 64;
  final double myProfileHeigt =
      SizerUtil.deviceType == DeviceType.tablet ? 19.h : 15.h;
  final double profileRadius =
      SizerUtil.deviceType == DeviceType.tablet ? 12.w : 13.w;
  final double profileContainerSize = 40.w;
  final double profileFontSize =
      SizerUtil.deviceType == DeviceType.tablet ? 7.sp : 9.sp;
  final double profileFontMaxSize =
      SizerUtil.deviceType == DeviceType.tablet ? 7.sp : 11.sp;
  final double profileSizedBoxSize = 35.w;
  final double profileIconSize = 10.sp;
  final double profileSizedWidth = 92.w;
}

// ProjectShadow
class ProjectBoxShadow {
  final BoxShadow projectBoxShadow =
      BoxShadow(color: kTextBlackColor, offset: Offset(0.5, 1), blurRadius: 5);
}

// Project decoration class
class ProjectDecoration {
  BoxDecoration boxDecorationImage(String name) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/$name"),
        fit: BoxFit.contain,
      ),
    );
  }

  BoxDecoration defaultBoxDecoration() {
    return BoxDecoration(borderRadius: kTopBorderRadius, color: kOtherColor);
  }

  BoxDecoration profileBoxDecoration() {
    return BoxDecoration(
        color: kPrimaryColor, borderRadius: kBottomBorderRadius);
  }

  BoxDecoration borderRadiusVertical(Color color) {
    return BoxDecoration(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(kDefaultPadding),
      ),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: color,
          blurRadius: 2.0,
        ),
      ],
    );
  }

  BoxDecoration activiytBoxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [kSecondaryColor, kPrimaryColor],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(0.5, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
      borderRadius: kBottomBorderRadius,
    );
  }
}

// Border Radius
class ProjectBorderRadius {
  BorderRadius defaultBorderRadius() {
    return BorderRadius.circular(kDefaultPadding);
  }

  BorderRadius borderRadiusDaily() {
    return BorderRadius.all(Radius.circular(kDefaultPadding));
  }

  BorderRadius projectMaxRadius() {
    return BorderRadius.circular(100.0);
  }
}

// final BoxDecoration activiytBoxDecorationButton = BoxDecoration(
//   gradient: LinearGradient(
//     colors: [kSecondaryColor, kPrimaryColor],
//     begin: const FractionalOffset(0.0, 0.0),
//     end: const FractionalOffset(0.5, 0.0),
//     stops: [0.0, 1.0],
//     tileMode: TileMode.clamp,
//   ),
//   borderRadius: kBottomBorderRadius,
// );

// final BoxDecoration borderRadiusVertical = BoxDecoration(
//     borderRadius: BorderRadius.vertical(top: Radius.circular(kDefaultPadding)),
//     color: kTextWhiteColor,
//     boxShadow: [
//       BoxShadow(
//         color: kPrimaryColor,
//         blurRadius: 2.0,
//       )
//     ]);

// final BoxDecoration borderRadiusVertialFee = BoxDecoration(
//   borderRadius: BorderRadius.vertical(
//     top: Radius.circular(kDefaultPadding),
//   ),
//   color: Colors.white,
//   boxShadow: [
//     BoxShadow(
//       color: kTextLightColor,
//       blurRadius: 2.0,
//     ),
//   ],
// );

// final BoxDecoration feeDecoration = BoxDecoration(
//   borderRadius: kTopBorderRadius,
//   color: kOtherColor,
// );

// final BoxDecoration boxDecorationActiviyContainer =
//     BoxDecoration(borderRadius: kTopBorderRadius, color: kOtherColor);

//final BorderRadius projectRadius = BorderRadius.circular(kDefaultPadding);
// final BorderRadius borderRadiusDaily =
//     BorderRadius.all(Radius.circular(kDefaultPadding));
//final BorderRadius projectMaxRadius = BorderRadius.circular(100.0);
