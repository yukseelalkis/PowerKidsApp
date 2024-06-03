import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ProjectContainerDecerotion(),
      child: BottomAppBar(
        color: kTextWhiteColor,
        child: ClipRRect(
          borderRadius: ProjectBorderRadius().defaultBorderRadius(),
          child: Container(
            height: ProjectSize().projectButtonRowHeight,
            child: Row(
              children: [
                navItem(Icons.home_outlined, pageIndex == 0,
                    onTap: () => onTap(0)),
                navItem(Icons.checklist, pageIndex == 1, onTap: () => onTap(1)),
                navItem(Icons.message_outlined, pageIndex == 2,
                    onTap: () => onTap(2)),
                navItem(Icons.account_circle_outlined, pageIndex == 3,
                    onTap: () => onTap(3))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Icon(icon,
            color: selected ? kSecondaryColor : kPrimaryColor.withOpacity(0.4)),
      ),
    );
  }
}

class ProjectContainerDecerotion extends BoxDecoration {
  ProjectContainerDecerotion()
      : super(
            borderRadius: ProjectBorderRadius().defaultBorderRadius(),
            gradient: const LinearGradient(
                colors: [kButtonBlueColor, kTextWhiteColor]),
            boxShadow: const [
              BoxShadow(
                  color: kTextBlackColor, offset: Offset(0.5, 1), blurRadius: 5)
            ],
            border: Border.all(width: 1, color: kTextBlackColor));
}
