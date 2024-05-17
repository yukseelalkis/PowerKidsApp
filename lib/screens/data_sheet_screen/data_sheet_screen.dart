import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:flutter_application_1/language/laguage.dart';
import 'package:flutter_application_1/screens/data_sheet_screen/data/data_sheet.dart';
import 'package:sizer/sizer.dart';

class DataSheetScreen extends StatelessWidget {
  const DataSheetScreen({Key? key}) : super(key: key);
  static const String routeName = 'DateSheetScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageItems.syllabusTitle),
      ),
      body: Container(
        width: ProjectSize().projecContainerWidth,
        decoration: ProjectDecoration().defaultBoxDecoration(),
        child: ListView.builder(
          itemCount: dateSheet.length,
          itemBuilder: (context, index) {
            return Container(
              margin: ProjectEdgeInsets().marginLeftRight,
              padding: ProjectEdgeInsets().edgeInsetsHalfAll,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customSizedBox(),
                  //first need a row, then 3 columns
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //1st column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dateSheet[index].date.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: kTextBlackColor,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          Text(dateSheet[index].monthName,
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),

                      //2nd one
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dateSheet[index].subjectName,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: kTextBlackColor,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          Text(dateSheet[index].dayName,
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                      //3rd one
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '🕒${dateSheet[index].time}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  customSizedBox(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class customSizedBox extends StatelessWidget {
  const customSizedBox({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3.h,
      child: Divider(
        thickness: 1.0,
      ),
    );
  }
}
