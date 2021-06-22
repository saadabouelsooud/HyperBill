import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/core/services/theme/styles/styles.dart';
import 'package:grocery/payments/ui/payments_screen.dart';
import 'package:grocery/prices/ui/prices_screen.dart';
import 'package:grocery/recharge/ui/recharge.dart';
import 'package:grocery/support/ui/support_screen.dart';
import 'package:kf_drawer/kf_drawer.dart';

import 'consumptions/ui/cosumption_screen.dart';
import 'dashboard/ui/dashboard_screen.dart';

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: DashboardScreen(),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Dashboard', style:TextStyles.LargeHeaderStyle),
          icon: Icon(Icons.dashboard, color: Colors.white),
          page: DashboardScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Consumptions',
            style: TextStyles.LargeHeaderStyle,
          ),
          icon: Icon(Icons.show_chart, color: Colors.white),
          page: ConsumptionsScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Payments',
            style:TextStyles.LargeHeaderStyle,
          ),
          icon: Icon(Icons.payment, color: Colors.white),
          page: PaymentsScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Recharge', style: TextStyles.LargeHeaderStyle),
          icon: Icon(Icons.charging_station, color: Colors.white),
          page: RechargeScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Prices',
            style:TextStyles.LargeHeaderStyle,
          ),
          icon: Icon(Icons.price_change, color: Colors.white),
          page: PricesScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Support',
            style:TextStyles.LargeHeaderStyle,
          ),
          icon: Icon(Icons.support, color: Colors.white),
          page: SupportScreen(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'HypeBill',
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        color:AppColors.hintColor,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 300),
                    ),
                  ],
                  repeatForever: true,
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                )
              ],
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'SIGN IN',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.input,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigator.of(context).push(CupertinoPageRoute(
            //   fullscreenDialog: true,
            //   builder: (BuildContext context) {
            //     return AuthPage();
            //   },
            // ));
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromRGBO(255, 255, 255, 1.0), AppColors.hintColor,],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}

class MainPage extends KFDrawerContent {
  MainPage({
    Key key,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
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
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Main'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontFamily: 'Horizon',
);
