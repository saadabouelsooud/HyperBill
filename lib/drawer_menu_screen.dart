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
import 'auth/ui/Login1Screen.dart';
import 'consumptions/ui/cosumption_screen.dart';
import 'core/services/preference/preference.dart';
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
          text: Text('Dashboard', style: TextStyles.LargeHeaderStyle),
          icon: Icon(Icons.dashboard, color: Colors.black),
          page: DashboardScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Consumptions',
            style: TextStyles.LargeHeaderStyle,
          ),
          icon: Icon(Icons.show_chart, color: Colors.black),
          page: ConsumptionsScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Payments',
            style: TextStyles.LargeHeaderStyle,
          ),
          icon: Icon(Icons.payment, color: Colors.black),
          page: PaymentsScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Recharge', style: TextStyles.LargeHeaderStyle),
          icon: Icon(Icons.charging_station, color: Colors.black),
          page: RechargeScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Prices',
            style: TextStyles.LargeHeaderStyle,
          ),
          icon: Icon(Icons.price_change, color: Colors.black),
          page: PricesScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Support',
            style: TextStyles.LargeHeaderStyle,
          ),
          icon: Icon(Icons.support, color: Colors.black),
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
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              children: [
                Image.asset("assets/images/k.jpg"),
              ],
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            ' Sign Out',
            style: TextStyle(color: Colors.black),
          ),
          icon: Icon(
            Icons.input,
            color: Colors.black,
          ),
          onPressed: () {
            Preference.clear();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c) => Login1Screen()), (route) => false);
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(255, 255, 255, 1.0),
              Color.fromRGBO(255, 255, 255, 1.0),
            ],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}



var icons = [
  Icons.dashboard,
  Icons.show_chart,
  Icons.payment,
  Icons.charging_station,
  Icons.price_change,
  Icons.support,
];

var screens = [
  DashboardScreen(),
  ConsumptionsScreen(),
  PaymentsScreen(),
  RechargeScreen(),
  PricesScreen(),
  SupportScreen()
];

var texts = ["Dashboard", "Consumptions", "Payments", "Recharge", "Prices", "Support"];
