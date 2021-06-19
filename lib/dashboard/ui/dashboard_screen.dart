import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:grocery/core/services/theme/styles/styles.dart';
import 'package:kf_drawer/kf_drawer.dart';

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



                  },
                  child: Padding(padding: EdgeInsets.all(15), child: Icon(Icons.person_pin)),
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
                      color: Colors.black,
                    ),
                    onPressed: widget.onMenuPressed,
                  ),
                ),
              ),
            )
            ,
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 600),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: Container(
                            height: 150,
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    AnimatedContainer(
                                        margin: EdgeInsets.all(20),
                                        duration: Duration(seconds: 2),
                                        curve: Curves.bounceIn,
                                        child: Icon(
                                          dashboardItemsIcons[index],
                                          color: AppColors.hintColor,
                                        )),
                                    AnimatedTextKit(
                                      animatedTexts: [
                                        TypewriterAnimatedText(
                                          dashboardItemsName[index],
                                          textStyle: TextStyles.hintHeaderStyle,
                                          speed: const Duration(milliseconds: 300),
                                        ),
                                      ],
                                      repeatForever: true,
                                      displayFullTextOnTap: true,
                                      stopPauseOnTap: true,
                                    )
                                  ],
                                ),

                                // Expanded(
                                //   child: Row(
                                //     children: [
                                //       Text(
                                //         dashboardItemsName[index],
                                //         style: TextStyles.largeHintHeaderStyle,
                                //       )
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
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
  Icons.money,
  Icons.flash_on,
  Icons.watch_later_outlined,
  Icons.alarm_add,
  Icons.attach_money_sharp,
  Icons.show_chart,
];
