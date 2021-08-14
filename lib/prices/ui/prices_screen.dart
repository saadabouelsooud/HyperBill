import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/dashboard/controller/dashboard_controller.dart';
import 'package:grocery/prices/controller/prices_controller.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'package:grocery/widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:photo_view/photo_view.dart';

import '../../drawer_lib.dart';

class PricesScreen extends KFDrawerContent {
  @override
  _PricesScreenState createState() => _PricesScreenState();
}

class _PricesScreenState extends State<PricesScreen> {


  int _currentSortColumn = 0;
  bool _isAscending = true;
  _itemChoice( choice) {
    if (choice == 1) {
      Navigator.of(context).push(MaterialPageRoute(builder: (c) => ProfileScreen()));
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:  AppBar(
      backgroundColor: Colors.white,
      title: Text("Prices".tr(),
          style: TextStyle(
            color: AppColors.textColor,
          )),
      actions: [
        PopupMenuButton(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/profile.png",),
          ),onSelected: _itemChoice,
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

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PhotoView(backgroundDecoration: BoxDecoration(color: Colors.white),
          imageProvider: AssetImage("assets/images/payments.png"),
        ),
      ),
    );
  }
}
