import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:flutter_application_1/screens/activity_screen/activity_widget.dart';
import 'package:flutter_application_1/screens/activity_screen/data/activity_data.dart';

class ActivtyScreen extends StatelessWidget {
  const ActivtyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Etkinlik"),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: kTopBorderRadius, color: kOtherColor),
                  child: ListView.builder(
                      padding: EdgeInsets.all(kDefaultPadding),
                      physics: BouncingScrollPhysics(),
                      itemCount: activityData.length,
                      itemBuilder: (context, int index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: kDefaultPadding),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(kDefaultPadding),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(kDefaultPadding)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.orange,
                                        blurRadius: 2.0,
                                      )
                                    ]),
                                child: Column(
                                  children: [
                                    ActivtyDetailRow(
                                        title: activityData[index].homeWork,
                                        statusValue: ""),
                                    SizedBox(
                                      height: kDefaultPadding,
                                      child: Divider(
                                        thickness: 1.0,
                                      ),
                                    ),
                                    ActivtyDetailRow(
                                        title: "Ödev:",
                                        statusValue:
                                            activityData[index].homeWork),
                                    sizedBox,
                                    ActivtyDetailRow(
                                      title: "Ders:",
                                      statusValue: activityData[index].lesson,
                                    ),
                                    sizedBox,
                                    ActivtyDetailRow(
                                      title: "Başlangıç tarihi:",
                                      statusValue:
                                          activityData[index].startingDate,
                                    ),
                                    sizedBox,
                                    ActivtyDetailRow(
                                      title: "Bitis tarihi:",
                                      statusValue:
                                          activityData[index].finishDate,
                                    ),
                                    sizedBox,
                                    ActivtyDetailRow(
                                      title: "Ödev değerlendirme:",
                                      statusValue:
                                          activityData[index].performance,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }))),
        ],
      ),
    );
  }
}
