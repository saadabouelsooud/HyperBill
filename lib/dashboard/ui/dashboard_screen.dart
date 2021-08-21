import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery/auth/ui/Login1Screen.dart';
import 'package:grocery/core/services/preference/preference.dart';
import 'package:grocery/core/services/theme/styles/styles.dart';
import 'package:grocery/dashboard/controller/dashboard_controller.dart';
import 'package:grocery/dashboard/model/meter_model.dart';
import 'package:grocery/drawer_lib.dart';
import 'package:grocery/profile/ui/profile_screen.dart';

import '../../widget.dart';
import 'package:easy_localization/easy_localization.dart';

class DashboardScreen extends KFDrawerContent {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  _itemChoice(choice) {
    if (choice == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (c) => ProfileScreen()));
    }
    if (choice == 2) {
      setState(() {
        if (EasyLocalization.of(context).locale == Locale('ar', "")) {
          EasyLocalization.of(context).setLocale(Locale('en', ""));
        } else {
          EasyLocalization.of(context).setLocale(Locale('ar', ""));
        }
      });
    }
  }

  final oCcy = new NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackground,
        foregroundColor: AppColors.primaryBackground,
        title: Text(
          "Dashboard".tr(),
          style: TextStyle(
            color: AppColors.textColor,
          ),
        ),
        actions: [
          PopupMenuButton(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/profile.png",
              ),
            ),
            onSelected: _itemChoice,
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Profile".tr()),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("language".tr()),
                value: 2,
              ),
            ],
          )
        ],
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          child: Material(
            shadowColor: Colors.transparent,
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: AppColors.textColor,
              ),
              onPressed: widget.onMenuPressed,
            ),
          ),
        ),
      ),
      body: Consumer(
        builder: (BuildContext context,
            T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
          var asyncValue = watch(dashboardMeterDataFutureProvider);

          return asyncValue.when(
              data: (data) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      SliderWidget(data),
                      Consumer(
                        builder: (BuildContext context,
                            T Function<T>(ProviderBase<Object, T>) watc,
                            Widget child) {
                          var asyncValue2 = watc(
                              dashboardMeterDetailsDataFutureProvider(
                                  context.read(counterProvider).state));

                          return asyncValue2.when(
                              data: (data) {
                                return GridView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    Item(
                                      icon: dashboardItemsIcons[0],
                                      text: dashboardItemsName[0],
                                      text2: oCcy.format(double.parse(
                                          data.balance.toStringAsFixed(2))),
                                    ),
                                    Item(
                                      icon: dashboardItemsIcons[1],
                                      text: dashboardItemsName[1],
                                      text2: data.status ? "ON" : "OFF",
                                    ),
                                    Item(
                                      icon: dashboardItemsIcons[2],
                                      text: dashboardItemsName[2],
                                      text2: data.totalConsumption,
                                    ),
                                    Item(
                                      icon: dashboardItemsIcons[3],
                                      text: dashboardItemsName[3],
                                      text2: data.lastReadingDate,
                                    ),
                                    Item(
                                      icon: dashboardItemsIcons[4],
                                      text: dashboardItemsName[4],
                                      text2: oCcy.format(double.parse(data
                                          .thisMonthConsumptionEgp
                                          .toStringAsFixed(2))),
                                    ),
                                    Item(
                                      icon: dashboardItemsIcons[5],
                                      text: dashboardItemsName[5],
                                      text2: data.thisMonthConsumptionKwh
                                          .toStringAsFixed(2),
                                    ),
                                  ],
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1 / 1.1,
                                    crossAxisCount: 2,
                                  ),
                                );
                              },
                              loading: () => SizedBox(),
                              error: (e, ee) {
                                print(ee.toString());

                                return Center(child: Text(e.toString()));
                              });
                        },
                      )
                    ],
                  ),
                );
              },
              loading: () => Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              error: (e, ee) {
                WidgetsBinding.instance.addPostFrameCallback((_){
                  Preference.clear();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => Login1Screen()),
                          (Route<dynamic> route) => false);

                });

                return Center(
                  child: Text(e.toString()),
                );
              });
        },
      ),
    );
  }
}

class Item extends StatefulWidget {
  final icon;
  final text;
  final text2;

  const Item({this.text, this.icon, this.text2});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<Item> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1.5).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: FadeTransition(
        opacity: _fadeInFadeOut,
        child: Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset(
                    widget.icon,
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.text,
                  style: TextStyles.headerStyle,
                ).tr(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.text2.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Schyler",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const dashboardItemsName = [
  "Current Balance",
  "Meter Status",
  "Total Consumption",
  "Last Reading Date",
  "This Month Consumption",
  "This Month Consumption",
];

const dashboardItemsIcons = [
  "assets/images/Current_Balance.svg",
  "assets/images/Meter_Status.svg",
  "assets/images/TotalConsumption.svg",
  "assets/images/Last_Reading_Date.svg",
  "assets/images/ThisMonthConsumption2.svg",
  "assets/images/ThisMonthConsumtion.svg",
];
