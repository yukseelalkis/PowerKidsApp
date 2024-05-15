import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:flutter_application_1/screens/fee_screen/widget/fee_widget.dart';
import 'data/fee_data.dart';

class FeeScreen extends StatelessWidget {
  const FeeScreen({Key? key}) : super(key: key);
  static String routeName = 'FeeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Ödeme')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: kTopBorderRadius,
                color: kOtherColor,
              ),
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(kDefaultPadding),
                  itemCount: fee.length,
                  itemBuilder: (context, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: kDefaultPadding),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(kDefaultPadding),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(kDefaultPadding),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: kTextLightColor,
                                  blurRadius: 2.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                FeeDetailRow(
                                  title: 'Makbuz No',
                                  statusValue: fee[index].receiptNo,
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                  child: Divider(
                                    thickness: 1.0,
                                  ),
                                ),
                                FeeDetailRow(
                                  title: 'Ay',
                                  statusValue: fee[index].month,
                                ),
                                sizedBox,
                                FeeDetailRow(
                                  title: 'Ödeme Tarihi',
                                  statusValue: fee[index].date,
                                ),
                                sizedBox,
                                FeeDetailRow(
                                  title: 'Durum',
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
                                  title: 'Toplam Tutar',
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
