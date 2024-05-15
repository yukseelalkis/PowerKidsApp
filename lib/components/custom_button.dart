import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final VoidCallback onPressed;
  final IconData icondata;
  const CustomButton(
      {Key? key,
      required this.title,
      required this.buttonColor,
      required this.icondata,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: buttonColor,
            foregroundColor: Colors.white,
          ),
          onPressed: onPressed,
          child: Container(
            width: 80,
            height: 125,
            child: Icon(
              icondata,
              color: Colors.white,
              size: 75,
            ),
          ),
        ),
        SizedBox(height: 10), // Başlık ile buton arasında boşluk bırakmak için
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class DefaultButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final IconData iconData;

  const DefaultButton(
      {Key? key,
      required this.onPress,
      required this.title,
      required this.iconData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.only(right: kDefaultPadding),
        width: 100.w,
        height: SizerUtil.deviceType == DeviceType.tablet ? 9.h : 7.h,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [kSecondaryColor, kPrimaryColor],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
            borderRadius: BorderRadius.circular(kDefaultPadding)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(title, style: Theme.of(context).textTheme.titleSmall),
            Spacer(),
            Icon(
              iconData,
              size: 26.sp,
              color: kOtherColor,
            )
          ],
        ),
      ),
    );
  }
}
