import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:sizer/sizer.dart';

class ActiviyButton extends StatelessWidget {
  const ActiviyButton(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onPress})
      : super(key: key);
  final String title;
  final IconData iconData;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: ProjectSize().projecContainerWidth,
        height: SizerUtil.deviceType == DeviceType.tablet ? 8.h : 7.h,
        decoration: ProjectDecoration().activiytBoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleSmall),
            Icon(
              iconData,
              color: kOtherColor,
              size: ProjectSize().defaultContainer,
            ),
          ],
        ),
      ),
    );
  }
}

class ActivtyDetailRow extends StatelessWidget {
  const ActivtyDetailRow(
      {Key? key, required this.title, required this.statusValue})
      : super(key: key);
  final String title;
  final String statusValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: kTextBlackColor,
                fontWeight: FontWeight.w900,
              ),
        ),
        Text(statusValue, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
