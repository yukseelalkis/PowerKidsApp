import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String textTitle;
  final void Function()? onTap;
  const MyButton({super.key, required this.textTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(color: Colors.grey),
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(textTitle),
        ),
      ),
    );
  }
}
