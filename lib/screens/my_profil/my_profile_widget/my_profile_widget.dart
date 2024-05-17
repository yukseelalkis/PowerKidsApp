import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants.dart';

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ProjectSize().profileContainerSize,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: kTextBlackColor,
                    fontSize: ProjectSize().profileFontSize),
              ),
              kHalfSizedBox,
              Text(value, style: Theme.of(context).textTheme.bodySmall),
              kHalfSizedBox,
              SizedBox(
                width: ProjectSize().profileSizedBoxSize,
                child: Divider(
                  thickness: 1.0,
                ),
              ),
            ],
          ),
          Icon(
            Icons.lock_outline,
            size: ProjectSize().profileIconSize,
          ),
        ],
      ),
    );
  }
}

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn(
      {Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: kTextBlackColor,
                    fontSize: ProjectSize().profileFontMaxSize),
              ),
              kHalfSizedBox,
              Text(value, style: Theme.of(context).textTheme.bodySmall),
              kHalfSizedBox,
              SizedBox(
                width: ProjectSize().profileSizedWidth,
                child: Divider(
                  thickness: 1.0,
                ),
              )
            ],
          ),
          Icon(Icons.lock_outline, size: ProjectSize().profileIconSize),
        ],
      ),
    );
  }
}
