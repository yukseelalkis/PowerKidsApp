import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants.dart';
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
            width: projectButtonRowWidth,
            height: projectButtonRowHeight,
            child: Center(child: Text(title)),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: projectRadius,
            ),
            backgroundColor: color,
            foregroundColor: kTextWhiteColor,
          ),
        ),
        SizedBox(width: sizedBoxWidth),
        Transform.translate(
          offset: Offset(-250, 0),
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(
              icon,
            ),
            label: Text(''),
            style: ElevatedButton.styleFrom(
              elevation: elevationSize,
              shape: RoundedRectangleBorder(borderRadius: projectRadius),
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
      padding: projectContainerTop,
      child: Container(
          width: projectImageContainerWidth,
          height: projectImageContainerHeight, // Örnek bir yükseklik
          decoration: ProjectDecoration().boxDecoration("$name")),
    );
  }
}
