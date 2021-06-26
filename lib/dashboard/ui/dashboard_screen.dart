import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
            AppBar(
              title: Text("Dashboard"),
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
                      color: Colors.black,
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
                                            child: Card(
                                              child: Item(
                                                icon: dashboardItemsIcons[0],
                                                text: dashboardItemsName[0],
                                                text2: data.balance,
                                              ),
                                            ),
                                          ),     Container(
                                            margin: EdgeInsets.all(20),
                                            child: Card(
                                              child: Item(
                                                icon: dashboardItemsIcons[1],
                                                text: dashboardItemsName[1],
                                                text2: data.status,
                                              ),
                                            ),
                                          ),     Container(
                                            margin: EdgeInsets.all(20),
                                            child: Card(
                                              child: Item(
                                                icon: dashboardItemsIcons[2],
                                                text: dashboardItemsName[2],
                                                text2: data.totalConsumption,
                                              ),
                                            ),
                                          ),     Container(
                                            margin: EdgeInsets.all(20),
                                            child: Card(
                                              child: Item(
                                                icon: dashboardItemsIcons[3],
                                                text: dashboardItemsName[3],
                                                text2: data.lastReadingDate,
                                              ),
                                            ),
                                          ),     Container(
                                            margin: EdgeInsets.all(20),
                                            child: Card(
                                              child: Item(
                                                icon: dashboardItemsIcons[4],
                                                text: dashboardItemsName[4],
                                                text2: data.thisMonthConsumptionEgp,
                                              ),
                                            ),
                                          ),     Container(
                                            margin: EdgeInsets.all(20),
                                            child: Card(
                                              child: Item(
                                                icon: dashboardItemsIcons[5],
                                                text: dashboardItemsName[5],
                                                text2: data.thisMonthConsumptionKwh,
                                              ),
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
                                        child: Text("something error please try again"),
                                      );
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
                          child: Text("something error please try again"),
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

class _MainPageState extends State<Item> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..forward();
  }

  double pi = 3.1415926535897932;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: child,
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            size: 40,
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
  Icons.money,
  Icons.flash_on,
  Icons.watch_later_outlined,
  Icons.alarm_add,
  Icons.attach_money_sharp,
  Icons.show_chart,
];
