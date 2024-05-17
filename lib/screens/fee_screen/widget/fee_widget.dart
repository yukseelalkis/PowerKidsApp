import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants.dart';

class FeeButton extends StatelessWidget {
  const FeeButton(
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
        height: ProjectSize().feeHeight,
        decoration: ProjectDecoration().activiytBoxDecoration(),
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [kSecondaryColor, kPrimaryColor],
        //     begin: const FractionalOffset(0.0, 0.0),
        //     end: const FractionalOffset(0.5, 0.0),
        //     stops: [0.0, 1.0],
        //     tileMode: TileMode.clamp,
        //   ),
        //   borderRadius: kBottomBorderRadius,
        // ),
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

class FeeDetailRow extends StatelessWidget {
  const FeeDetailRow({Key? key, required this.title, required this.statusValue})
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
