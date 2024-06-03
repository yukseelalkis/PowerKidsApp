import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:flutter_application_1/language/laguage.dart';
import 'package:flutter_application_1/routes.dart';

class CustomRow extends StatelessWidget {
  const CustomRow(
      {Key? key,
      required this.title,
      required this.icon,
      required this.color,
      required this.page})
      : super(key: key);

  final String title;
  final IconData icon;
  final Color color;
  final Widget page;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            ProjectRouteScreen().navigateToDailyFlowScreen(context, page);
          },
          child: Container(
            width: ProjectSize().projectLoginButtonRowWidth,
            height: ProjectSize().projectButtonRowHeight,
            child: Center(child: Text(title)),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: ProjectBorderRadius().defaultBorderRadius(),
            ),
            backgroundColor: color,
            foregroundColor: kTextWhiteColor,
          ),
        ),
        SizedBox(width: ProjectSize().loginSizedBoxWidth),
        Transform.translate(
          offset: Offset(-250, 0),
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(
              icon,
            ),
            label: Text(''),
            style: ElevatedButton.styleFrom(
              elevation: ProjectSize().elevationSize,
              shape: RoundedRectangleBorder(
                borderRadius: ProjectBorderRadius().defaultBorderRadius(),
              ),
              backgroundColor: color,
              foregroundColor: kTextWhiteColor,
            ),
          ),
        ),
      ],
    );
  }
}

class pngContainer extends StatelessWidget {
  final String name;
  const pngContainer({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectEdgeInsets().projectContainerTop,
      child: Container(
          width: ProjectSize().projecContainerWidth,
          height:
              ProjectSize().projectImageContainerHeight, // Örnek bir yükseklik
          decoration: ProjectDecoration().boxDecorationImage("$name")),
    );
  }
}

