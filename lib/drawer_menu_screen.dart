import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grocery/core/services/theme/styles/styles.dart';
import 'package:grocery/payments/ui/payments_screen.dart';
import 'package:grocery/prices/ui/prices_screen.dart';
import 'package:grocery/recharge/ui/recharge.dart';
import 'package:grocery/support/ui/support_screen.dart';
import 'package:grocery/widget.dart';
import 'auth/ui/Login1Screen.dart';
import 'consumptions/ui/cosumption_screen.dart';
import 'core/services/preference/preference.dart';
import 'dashboard/ui/dashboard_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;

import 'drawer_lib.dart';

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
    _drawerController = KFDrawerController(
      initialPage: DashboardScreen(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
      child: Scaffold(
        body: KFDrawer(
          animationDuration: Duration(milliseconds: 400),
          controller: _drawerController,
          items: [
            KFDrawerItem.initWithPage(
              onPressed: () {
                _drawerController.page = DashboardScreen();
                _drawerController.close();
              },
              text:
                  Text('Dashboard'.tr(), style: TextStyles.LargeHeaderStyle),
              icon: Icon(Icons.dashboard, color: Colors.black),
              page: DashboardScreen(),
            ),
            KFDrawerItem.initWithPage(
              onPressed: () {
                _drawerController.page = ConsumptionsScreen();
                _drawerController.close();
              },
              text: Text(
                'Consumptions'.tr(),
                style: TextStyles.LargeHeaderStyle,
              ),
              icon: Icon(Icons.show_chart, color: Colors.black),
              page: ConsumptionsScreen(),
            ),
            KFDrawerItem.initWithPage(
              onPressed: () {
                _drawerController.page = PaymentsScreen();
                _drawerController.close();
              },
              text: Text(
                'Payments'.tr(),
                style: TextStyles.LargeHeaderStyle,
              ),
              icon: Icon(Icons.payment, color: Colors.black),
              page: PaymentsScreen(),
            ),
            KFDrawerItem.initWithPage(
              onPressed: () {
                _drawerController.page = RechargeScreen();
                _drawerController.close();
              },
              text: Text('Recharge'.tr(), style: TextStyles.LargeHeaderStyle),
              icon: Icon(Icons.charging_station, color: Colors.black),
              page: RechargeScreen(),
            ),
            KFDrawerItem.initWithPage(
              onPressed: () {
                _drawerController.page = PricesScreen();
                _drawerController.close();
              },
              text: Text(
                'Prices'.tr(),
                style: TextStyles.LargeHeaderStyle,
              ),
              icon: Icon(Icons.price_change, color: Colors.black),
              page: PricesScreen(),
            ),
            KFDrawerItem.initWithPage(
              onPressed: () {
                _drawerController.page = SupportScreen();
                _drawerController.close();
              },
              text: Text(
                'Support'.tr(),
                style: TextStyles.LargeHeaderStyle,
              ),
              icon: Icon(Icons.support, color: Colors.black),
              page: SupportScreen(),
            ),
          ],
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
              ' Sign Out'.tr(),
              style: TextStyle(color: Colors.black),
            ),
            icon: Icon(
              Icons.input,
              color: Colors.black,
            ),
            onPressed: () {
              Preference.clear();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (c) => Login1Screen()),
                  (route) => false);
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
      ),
    );
  }
}


