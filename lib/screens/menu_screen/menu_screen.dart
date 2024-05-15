import 'package:flutter/material.dart';
import 'package:flutter_application_1/language/laguage.dart';

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
        title: Center(child: Text('Yemek Menüsü')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 75,
                color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildDay('Pazartesi'),
                    buildDay('Salı'),
                    buildDay('Çarşamba'),
                    buildDay('Perşembe'),
                    buildDay('Cuma'),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      "Sabah Kahvaltisi",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  CustomListTile(
                    title: "Recel",
                    color: Colors.blue,
                    clock: LanguageItems.breakfastTime,
                  ),
                  CustomListTile(
                    title: "Bal",
                    color: Colors.orange,
                    clock: LanguageItems.breakfastTime,
                  ),
                  CustomListTile(
                    title: "Kizarmis Ekmek",
                    color: Colors.yellow,
                    clock: LanguageItems.breakfastTime,
                  ),
                  CustomListTile(
                    title: "Sut",
                    color: Colors.green,
                    clock: LanguageItems.breakfastTime,
                  )
                ],
              ),
            ),
            Divider(
              thickness: 3.0,
              color: Colors.black,
            ),
            Container(
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      "Ogle Yemegi",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  CustomListTile(
                    title: "Etli patates",
                    color: Colors.blue,
                    clock: LanguageItems.lunchTime,
                  ),
                  CustomListTile(
                    title: "Pilav",
                    color: Colors.orange,
                    clock: LanguageItems.lunchTime,
                  ),
                  CustomListTile(
                    title: "Ayran",
                    color: Colors.green,
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

//
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
