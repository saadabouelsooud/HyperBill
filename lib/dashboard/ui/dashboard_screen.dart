import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:grocery/core/services/theme/styles/styles.dart';
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
                InkWell( onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (c) => ProfileScreen()));
                },child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/images/profile.png",),
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
            SliderWidget(1),

            Expanded(
              child: AnimationLimiter(
                child: GridView.builder(
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 2),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: Container(
                            margin: EdgeInsets.all(20),
                            child: Card(
                              child: Item(
                                icon: dashboardItemsIcons[index],
                                text: dashboardItemsName[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item extends StatefulWidget {
  final icon;
  final text;

  const Item({this.text, this.icon});

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
    // TODO: implement dispose
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
            "60,500 Eg",
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
