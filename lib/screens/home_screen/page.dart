import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:flutter_application_1/language/laguage.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/screens/activity_screen/activity_screen.dart';
import 'package:flutter_application_1/screens/daily_flow_screen/daily_flow_screen.dart';
import 'package:flutter_application_1/screens/data_sheet_screen/data_sheet_screen.dart';
import 'package:flutter_application_1/screens/fee_screen/fee_screen.dart';
import 'package:flutter_application_1/screens/home_screen/home_screen.dart';
import 'package:flutter_application_1/screens/menu_screen/menu_screen.dart';

class Page extends StatelessWidget {
  final int tab;
  const Page({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageItems.homeAppBarTitle),
      ),
      body: Column(
        children: [
          Padding(
            padding: ProjectEdgeInsets().edgeInsetsHomeOnly,
            child: Center(
              child: Row(
                children: [
                  CustomButton(
                    title: LanguageItems.flowButtons,
                    buttonColor: kButtonBlueColor,
                    onPressed: () {
                      ProjectRouteScreen().navigateToDailyFlowScreen(
                          context, DailyFlowScreen());
                    },
                    icondata: Icons.format_align_left_rounded,
                  ),
                  CustomContainer(
                    color: kButtonBlueColor,
                  ),
                  CustomButton(
                    title: LanguageItems.activityButton,
                    buttonColor: kPrimaryColor,
                    onPressed: () {
                      ProjectRouteScreen()
                          .navigateToDailyFlowScreen(context, ActivtyScreen());
                    },
                    icondata: Icons.interests_outlined,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: ProjectEdgeInsets().edgeInsetsHomeOnly,
            child: Center(
              child: Row(
                children: [
                  CustomButton(
                    title: LanguageItems.menuButton,
                    buttonColor: kButtonYellowColor,
                    onPressed: () {
                      ProjectRouteScreen()
                          .navigateToDailyFlowScreen(context, MenuScreen());
                    },
                    icondata: Icons.dining_rounded,
                  ),
                  CustomContainer(color: kButtonYellowColor),
                  CustomButton(
                    title: LanguageItems.dataSheetButton,
                    buttonColor: kButtonBlueColor,
                    onPressed: () {
                      ProjectRouteScreen().navigateToDailyFlowScreen(
                          context, DataSheetScreen());
                    },
                    icondata: Icons.calendar_month_outlined,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: ProjectEdgeInsets().edgeInsetsHomeLast,
            child: Center(
              child: Row(
                children: [
                  CustomButton(
                    title: LanguageItems.newsButton,
                    buttonColor: kButtonRedColor,
                    onPressed: () {},
                    icondata: Icons.article_outlined,
                  ),
                  CustomContainer(color: kButtonRedColor),
                  CustomButton(
                    title: LanguageItems.feeButton,
                    buttonColor: kButtonGreenColor,
                    onPressed: () {
                      ProjectRouteScreen()
                          .navigateToDailyFlowScreen(context, FeeScreen());
                    },
                    icondata: Icons.account_balance_wallet_outlined,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
