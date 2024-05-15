import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DailyFlowScreen extends StatefulWidget {
  const DailyFlowScreen({super.key});
  static String routeName = 'DailyFlowScreen';
  @override
  State<DailyFlowScreen> createState() => _DailyFlowScreen();
}

class _DailyFlowScreen extends State<DailyFlowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Gunluk Akis")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor:
                    Colors.red, // Buton rengini kırmızı olarak ayarlar
                minimumSize: Size(100, 40), // Butonun minimum boyutunu ayarlar
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_a_photo_outlined),
                  SizedBox(
                      width: 8), // İkon ve etiket arasında bir boşluk ekler
                  Container(
                    width: 100,
                    child: Text(
                      "Fotoğraf Ekle",
                      textAlign: TextAlign.center, // Metni merkeze hizalar
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                width: 300,
                height: 200,
                child: Center(
                  child: Text("Lütfen Fotoğraf yükleyiniz"),
                ),
              ),
            ),
            CustomTextField(
              backgroundColor: Colors.orange,
              minLines: 2,
              title: "Baslik",
            ),
            CustomTextField(
              backgroundColor: Colors.blue,
              minLines: 4,
              title: "Aciklama",
            ),
            Container(
              height: 15.h, // Örnek bir yükseklik
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/main_button.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final Color backgroundColor;
  final int minLines;
  final String title;
  const CustomTextField({
    required this.backgroundColor,
    required this.minLines,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        enabled: false,
        minLines: minLines,
        maxLines: 6,
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor, // Arka plan rengi
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none, // Kenar çizgisi olmadığından emin ol
          ),
          labelText: title,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.black), // Yazı rengi
        ),
      ),
    );
  }
}
