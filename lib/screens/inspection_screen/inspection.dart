import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:flutter_application_1/language/laguage.dart';
import 'package:flutter_application_1/screens/inspection_screen/insection_data.dart';
import 'package:flutter_application_1/screens/inspection_screen/inspection_widget.dart';

class InspectionScreen extends StatelessWidget {
  const InspectionScreen({Key? key}) : super(key: key);
  static String routeName = 'InspectionScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Yoklama")),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: ProjectDecoration().defaultBoxDecoration(),
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: ProjectEdgeInsets().edgeInsetsAll,
                  itemCount: InspectionDatas.length,
                  itemBuilder: (context, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: kDefaultPadding),
                      child: Column(
                        children: [
                          Container(
                            padding: ProjectEdgeInsets().edgeInsetsAll,
                            decoration: ProjectDecoration()
                                .borderRadiusVertical(kTextLightColor),
                            child: Column(
                              children: [
                                InspectionButtonDetailRow(
                                    title: "Devamsizlik", statusValue: "b"),
                                SizedBox(
                                  height: kDefaultPadding,
                                  child: Divider(
                                    thickness: 1.0,
                                  ),
                                ),
                                InspectionButtonDetailRow(
                                  title: "Raporlu Devamsizlik",
                                  statusValue: InspectionDatas[index]
                                      .absenteeismWithReport,
                                ),
                                sizedBox,
                                InspectionButtonDetailRow(
                                  title: "Raporsuz Devamsizlik",
                                  statusValue: InspectionDatas[index]
                                      .absenceWithoutReport,
                                ),
                                sizedBox,
                                InspectionButtonDetailRow(
                                  title: "Toplam",
                                  statusValue: InspectionDatas[index].total,
                                ),
                              ],
                            ),
                          ),
                          InspectionButton(
                              title: "Detay",
                              iconData: InspectionDatas[index].total == 'Paid'
                                  ? Icons.download_outlined
                                  : Icons.arrow_forward_outlined,
                              onPress: () {})
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
