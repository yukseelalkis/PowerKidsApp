import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/contants.dart';
import 'package:flutter_application_1/language/laguage.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/screens/activity_screen/activity_screen.dart';
import 'package:flutter_application_1/screens/chat_home/chat_home.screen.dart';
import 'package:flutter_application_1/screens/daily_flow_screen/daily_flow_screen.dart';
import 'package:flutter_application_1/screens/data_sheet_screen/data_sheet_screen.dart';
import 'package:flutter_application_1/screens/fee_screen/fee_screen.dart';
import 'package:flutter_application_1/screens/home_screen/nav_model.dart';
import 'package:flutter_application_1/screens/home_screen/nav_bar.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/screens/inspection_screen/inspection.dart';
import 'package:flutter_application_1/screens/menu_screen/menu_screen.dart';
import 'package:flutter_application_1/screens/message_screen/message.dart';
import 'package:flutter_application_1/screens/my_profil/my_profile_screen/my_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final inspectionNavKey = GlobalKey<NavigatorState>();
  final messageNavKey = GlobalKey<NavigatorState>();
  final userNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  late List<NavModel> _items;

  @override
  void initState() {
    super.initState();
    _items = [
      NavModel(
        page: const Page(tab: 0),
        navKey: homeNavKey,
      ),
      NavModel(
        page: const InspectionScreen(),
        navKey: inspectionNavKey,
      ),
      NavModel(
        page: ChatHomeScreen(),
        navKey: messageNavKey,
      ),
      NavModel(
        page: const MyProfileScreen(),
        navKey: userNavKey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_items[selectedTab].navKey.currentState?.canPop() ?? false) {
          _items[selectedTab].navKey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: selectedTab,
          children: _items
              .map((page) => Navigator(
                    key: page.navKey,
                    onGenerateInitialRoutes: (navigator, initialRoute) {
                      return [
                        MaterialPageRoute(builder: (context) => page.page)
                      ];
                    },
                  ))
              .toList(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: ProjectEdgeInsets().projectButtonHalfTop,
          height: ProjectSize().floatinContainerSize,
          width: ProjectSize().floatinContainerSize,
          child: FloatingActionButton(
            backgroundColor: kTextWhiteColor,
            elevation: 10,
            onPressed: () {
              ProjectRouteScreen()
                  .navigateToDailyFlowScreen(context, Placeholder());
            },
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 3,
                color: kTextWhiteColor,
              ),
              borderRadius: ProjectBorderRadius().projectMaxRadius(),
            ),
            child: const Icon(
              Icons.add,
              color: kButtonGreenColor,
            ),
          ),
        ),
        bottomNavigationBar: NavBar(
          pageIndex: selectedTab,
          onTap: (index) {
            if (index == selectedTab) {
              _items[index]
                  .navKey
                  .currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                selectedTab = index;
              });
            }
          },
        ),
      ),
    );
  }
}

class HomeTabPage extends StatelessWidget {
  const HomeTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Screen'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Page(tab: 0),
                  ),
                );
              },
              child: Text(LanguageItems.goPage),
            )
          ],
        ),
      ),
    );
  }
}

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

class CustomContainer extends StatelessWidget {
  final Color color;
  const CustomContainer({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 90,
      height: 10,
    );
  }
}
