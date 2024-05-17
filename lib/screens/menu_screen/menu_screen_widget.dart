//
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final Color color;
  final String clock;
  const CustomListTile(
      {super.key,
      required this.title,
      required this.color,
      required this.clock});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.food_bank_outlined,
        color: color,
        size: 50,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      // sabit degeleri olcak
      subtitle: Text(clock),
    );
  }
}
