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

class ProjectDecoration {
  BoxDecoration boxDecoration(String name) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/$name"),
        fit: BoxFit.contain,
      ),
    );
  }
}

final EdgeInsets projectContainerTop = EdgeInsets.only(top: 50);
final EdgeInsets projectButtonTop = EdgeInsets.only(top: 20);
final EdgeInsets projectButtonHalfTop = EdgeInsets.only(top: 10);
final EdgeInsets projectButtonLeft = EdgeInsets.only(left: 50);
final double projectButtonRowWidth = 150;
final double projectButtonRowHeight = 50;
final BorderRadius projectRadius = BorderRadius.circular(20.0);
final double sizedBoxWidth = 10;
final double sizedBoxHeigth = 20;
final double elevationSize = 10;
final double projectImageContainerWidth = 100.w;
final double projectImageContainerHeight = 30.h;
final EdgeInsets edgeInsetsOnly = EdgeInsets.only(left: 5.w, right: 5.w);
final BoxShadow boxShadow =
    BoxShadow(color: kTextBlackColor, offset: Offset(0.5, 1), blurRadius: 5);
final double floatinContainerSize = 64;
final BorderRadius projectMaxRadius = BorderRadius.circular(100.0);
final EdgeInsets edgeInsetsHomeOnly = const EdgeInsets.only(left: 22, top: 25);
final EdgeInsets edgeInsetsHomeLast = const EdgeInsets.only(left: 15, top: 25);
