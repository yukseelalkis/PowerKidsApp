import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:flutter_application_1/language/laguage.dart';
import 'package:flutter_application_1/screens/menu_screen/menu_screen_widget.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String? selectedDay; // Seçili günü saklamak için bir değişken

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(LanguageItems.menuTitle)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: ProjectEdgeInsets().projectButtonTop,
              child: Container(
                height: ProjectSize().menuButton,
                color: kPrimaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildDay(LanguageItems.mondayTitle),
                    buildDay(LanguageItems.tuesdasyTitle),
                    buildDay(LanguageItems.wednesdayTitle),
                    buildDay(LanguageItems.thursdayTitle),
                    buildDay(LanguageItems.fridayTitle),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      LanguageItems.breakfastTitle,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  CustomListTile(
                    title: "Recel",
                    color: kButtonBlueColor,
                    clock: LanguageItems.breakfastTime,
                  ),
                  CustomListTile(
                    title: "Bal",
                    color: kPrimaryColor,
                    clock: LanguageItems.breakfastTime,
                  ),
                  CustomListTile(
                    title: "Kizarmis Ekmek",
                    color: kButtonYellowColor,
                    clock: LanguageItems.breakfastTime,
                  ),
                  CustomListTile(
                    title: "Sut",
                    color: kButtonGreenColor,
                    clock: LanguageItems.breakfastTime,
                  )
                ],
              ),
            ),
            Divider(
              thickness: 3.0,
              color: kTextBlackColor,
            ),
            Container(
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      LanguageItems.lunchTitle,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  CustomListTile(
                    title: "Etli patates",
                    color: kButtonBlueColor,
                    clock: LanguageItems.lunchTime,
                  ),
                  CustomListTile(
                    title: "Pilav",
                    color: kPrimaryColor,
                    clock: LanguageItems.lunchTime,
                  ),
                  CustomListTile(
                    title: "Ayran",
                    color: kButtonGreenColor,
                    clock: LanguageItems.lunchTime,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDay(String day) {
    // Seçili gün kontrolü
    bool isSelected = selectedDay == day;
    return GestureDetector(
      onTap: () {
        // Tıklanan günü seçili gün olarak ayarla
        setState(() {
          selectedDay = day;
        });
      },
      child: Container(
        color: isSelected ? Colors.white : null, // Seçili günü beyaz yap
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(day),
        ),
      ),
    );
  }
}
