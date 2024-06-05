import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const UserTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            // icon
            const Icon(Icons.person_2_outlined),

            const SizedBox(
              width: 20,
            ),
            // user name
            Text(title),
          ],
        ),
      ),
    );
  }
}
