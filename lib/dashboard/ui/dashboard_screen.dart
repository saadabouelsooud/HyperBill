import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery/core/services/theme/styles/styles.dart';
import 'package:grocery/dashboard/controller/dashboard_controller.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'package:kf_drawer/kf_drawer.dart';

import '../../widget.dart';

class DashboardScreen extends KFDrawerContent {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            AppBar(backgroundColor: AppColors.primaryBackground,foregroundColor:AppColors.primaryBackground ,
              title: Text("Dashboard",style: TextStyle(color: AppColors.textColor,),),
              actions: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (c) => ProfileScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        "assets/images/profile.png",
                      ),
                    ))
              ],
              leading: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                child: Material(
                  shadowColor: Colors.transparent,
                  color: Colors.transparent,
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color:AppColors.textColor,
                    ),
                    onPressed: widget.onMenuPressed,
                  ),
                ),
              ),
            ),
            Consumer(
              builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
                var asyncValue = watch(dashboardMeterDataFutureProvider);
                int count = watch(counterProvider).state;

                return asyncValue.when(
                    data: (data) {
                      return Expanded(
                        child: ListView(
                          children: [
                            SliderWidget(data),
                            Consumer(
                              builder:
                                  (BuildContext context, T Function<T>(ProviderBase<Object, T>) watc, Widget child) {
                                var asyncValue2 = watc(dashboardMeterDetailsDataFutureProvider(count + 1));
                                return asyncValue2.when(
                                    data: (data) {
                                      return GridView(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(20),
                                            child: Item(
                                              icon: dashboardItemsIcons[0],
                                              text: dashboardItemsName[0],
                                              text2: data.balance,
                                            ),
                                          ),     Container(
                                            margin: EdgeInsets.all(20),
                                            child: Item(
                                              icon: dashboardItemsIcons[1],
                                              text: dashboardItemsName[1],
                                              text2: data.status,
                                            ),
                                          ),     Container(
                                            margin: EdgeInsets.all(20),
                                            child: Item(
                                              icon: dashboardItemsIcons[2],
                                              text: dashboardItemsName[2],
                                              text2: data.totalConsumption,
                                            ),
                                          ),     Container(
                                            margin: EdgeInsets.all(20),
                                            child: Item(
                                              icon: dashboardItemsIcons[3],
                                              text: dashboardItemsName[3],
                                              text2: data.lastReadingDate,
                                            ),
                                          ),     Container(
                                            margin: EdgeInsets.all(20),
                                            child: Item(
                                              icon: dashboardItemsIcons[4],
                                              text: dashboardItemsName[4],
                                              text2: data.thisMonthConsumptionEgp,
                                            ),
                                          ),     Container(
                                            margin: EdgeInsets.all(20),
                                            child: Item(
                                              icon: dashboardItemsIcons[5],
                                              text: dashboardItemsName[5],
                                              text2: data.thisMonthConsumptionKwh,
                                            ),
                                          ),
                                        ],
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                        ),
                                      );
                                    },
                                    loading: () => Center(child: CircularProgressIndicator()),
                                    error: (e, ee) {
                                      print(ee.toString());

                                      return Center(
                                        child: Text(e.toString()));
                                    });
                              },
                            )
                          ],
                        ),
                      );
                    },
                    loading: () => Center(
                          child: CircularProgressIndicator(),
                        ),
                    error: (e, ee) => Center(
                          child: Text(e.toString()),
                        ));
              },
            )
          ],
        ),
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

class _MainPageState extends State<Item> with  TickerProviderStateMixin  {
  AnimationController _controller;
  Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2),);
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(_controller);

    _controller.forward();
  }



  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(

      opacity: _fadeInFadeOut,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,width: 30,
              child: SvgPicture.asset(
                  widget.icon
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.text,
                  style: TextStyles.headerStyle,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.text2.toString(),
              style: TextStyles.largeHintHeaderStyle,
            ),
          ],
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
