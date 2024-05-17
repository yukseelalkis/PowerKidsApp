import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:flutter_application_1/language/laguage.dart';
import 'package:flutter_application_1/screens/activity_screen/activity_widget.dart';
import 'package:flutter_application_1/screens/activity_screen/data/activity_data.dart';

class ActivtyScreen extends StatelessWidget {
  const ActivtyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(LanguageItems.activityTitlte),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                  decoration: ProjectDecoration().defaultBoxDecoration(),
                  child: ListView.builder(
                      padding: ProjectEdgeInsets().edgeInsetsAll,
                      physics: BouncingScrollPhysics(),
                      itemCount: activityData.length,
                      itemBuilder: (context, int index) {
                        return Container(
                          margin: ProjectEdgeInsets()
                              .projectActivityContainerBottom,
                          child: Column(
                            children: [
                              Container(
                                padding: ProjectEdgeInsets().edgeInsetsAll,
                                decoration: ProjectDecoration()
                                    .borderRadiusVertical(kPrimaryColor),
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
                                        title: LanguageItems.homeworkTitle,
                                        statusValue:
                                            activityData[index].homeWork),
                                    sizedBox,
                                    ActivtyDetailRow(
                                      title: LanguageItems.lessonTitle,
                                      statusValue: activityData[index].lesson,
                                    ),
                                    sizedBox,
                                    ActivtyDetailRow(
                                      title: LanguageItems.startTimeTitle,
                                      statusValue:
                                          activityData[index].startingDate,
                                    ),
                                    sizedBox,
                                    ActivtyDetailRow(
                                      title: LanguageItems.finishTimeTitle,
                                      statusValue:
                                          activityData[index].finishDate,
                                    ),
                                    sizedBox,
                                    ActivtyDetailRow(
                                      title: LanguageItems.performanceTitle,
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
