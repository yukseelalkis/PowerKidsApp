import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:flutter_application_1/language/laguage.dart';
import 'package:flutter_application_1/screens/my_profil/my_profile_widget/my_profile_widget.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);
  static String routeName = 'MyProfileScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar theme for tablet
      appBar: AppBar(
        title: Text(LanguageItems.myProfileTitle),
        actions: [
          InkWell(
            onTap: () {
              //Profildeki bazı değişiklikler yapmak istersek okul admini bunu yapmasi icin
            },
            child: Container(
              padding: EdgeInsets.only(right: kDefaultPadding / 2),
              child: Row(
                children: [
                  Icon(Icons.report_gmailerrorred_outlined),
                  kHalfWidthSizedBox,
                  Text(
                    LanguageItems.reportTitle,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: kOtherColor,
        child: Column(
          children: [
            Container(
              width: ProjectSize().projecContainerWidth,
              height: ProjectSize().myProfileHeigt,
              decoration: ProjectDecoration().profileBoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: ProjectSize().profileRadius,
                    backgroundColor: kTextWhiteColor,
                    backgroundImage: AssetImage('assets/images/indir.jpeg'),
                  ),
                  kWidthSizedBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // veritabanindan gelecek
                      Text(
                        'User',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text('Anaokul',
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  )
                ],
              ),
            ),
            sizedBox,
            //VeriTabaninindan gelecek
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileDetailRow(
                    title: LanguageItems.idTitle, value: '0000001'),
                ProfileDetailRow(
                    title: LanguageItems.academicYear, value: '2023-2024'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileDetailRow(
                    title: LanguageItems.classTitle, value: 'Mezun'),
                ProfileDetailRow(
                    title: LanguageItems.schoolNo, value: '000126'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileDetailRow(
                    title: LanguageItems.birthDayTitle, value: '1 Ocak 2018'),
              ],
            ),
            sizedBox,
            ProfileDetailColumn(
              title: LanguageItems.mailTitle,
              value: 'user@gmail.com',
            ),
            ProfileDetailColumn(
              title: LanguageItems.fatherName,
              value: 'User Father',
            ),
            ProfileDetailColumn(
              title: LanguageItems.motherName,
              value: 'User Mother',
            ),
            ProfileDetailColumn(
              title: LanguageItems.parentNo,
              value: '+90555-555-5555',
            ),
          ],
        ),
      ),
    );
  }
}
