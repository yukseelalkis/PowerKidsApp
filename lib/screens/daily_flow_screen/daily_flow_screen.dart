import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:flutter_application_1/language/laguage.dart';

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
        title: Center(child: Text(LanguageItems.daliyFlowTitle)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            customDailyButton(),
            Padding(
              padding: ProjectEdgeInsets().projectContainerTop,
              child: Container(
                width: ProjectSize().addPhotoContainerWidth,
                height: ProjectSize().addPhotoContainerHeight,
                child: Center(
                  child: Text(LanguageItems.addPhotoPls),
                ),
              ),
            ),
            CustomTextField(
              backgroundColor: kPrimaryColor,
              minLines: 2,
              title: LanguageItems.dailyflowTextFielTitle,
            ),
            CustomTextField(
              backgroundColor: kButtonBlueColor,
              minLines: 4,
              title: LanguageItems.explanationTxtFielTitle,
            ),
            Container(
                height: ProjectSize()
                    .projectImageContainerHalfHeight, // Örnek bir yükseklik
                decoration:
                    ProjectDecoration().boxDecorationImage("main_button.png")),
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
      padding: ProjectEdgeInsets().edgeInsetsHalfAll,
      child: TextField(
        enabled: false,
        minLines: minLines,
        maxLines: 6,
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor, // Arka plan rengi
          border: OutlineInputBorder(
            borderRadius: ProjectBorderRadius().borderRadiusDaily(),
            borderSide: BorderSide.none, // Kenar çizgisi olmadığından emin ol
          ),
          labelText: title,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: kTextBlackColor), // Yazı rengi
        ),
      ),
    );
  }
}
