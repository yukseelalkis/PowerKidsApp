import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:flutter_application_1/language/laguage.dart';
import 'package:flutter_application_1/screens/fee_screen/widget/fee_widget.dart';
import 'data/fee_data.dart';

class FeeScreen extends StatelessWidget {
  const FeeScreen({Key? key}) : super(key: key);
  static String routeName = 'FeeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(LanguageItems.feeButton)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: ProjectDecoration().defaultBoxDecoration(),
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: ProjectEdgeInsets().edgeInsetsAll,
                  itemCount: fee.length,
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
                                FeeDetailRow(
                                  title: LanguageItems.receiptNoTitle,
                                  statusValue: fee[index].receiptNo,
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                  child: Divider(
                                    thickness: 1.0,
                                  ),
                                ),
                                FeeDetailRow(
                                  title: LanguageItems.monthTitle,
                                  statusValue: fee[index].month,
                                ),
                                sizedBox,
                                FeeDetailRow(
                                  title: LanguageItems.dateTitle,
                                  statusValue: fee[index].date,
                                ),
                                sizedBox,
                                FeeDetailRow(
                                  title: LanguageItems.paymentStatusTitle,
                                  statusValue: fee[index].paymentStatus,
                                ),
                                sizedBox,
                                SizedBox(
                                  height: kDefaultPadding,
                                  child: Divider(
                                    thickness: 1.0,
                                  ),
                                ),
                                FeeDetailRow(
                                  title: LanguageItems.totalAmountTitle,
                                  statusValue: fee[index].totalAmount,
                                ),
                              ],
                            ),
                          ),
                          FeeButton(
                              title: fee[index].btnStatus,
                              iconData: fee[index].btnStatus == 'Paid'
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
