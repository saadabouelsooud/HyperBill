import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/dashboard/controller/dashboard_controller.dart';
import 'package:grocery/payments/controller/payment_controller.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../drawer_lib.dart';
import '../../widget.dart';

class PaymentsScreen extends KFDrawerContent {
  @override
  _PaymentsScreenState createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  int _currentSortColumn = 0;
  bool _isAscending = true;
  final oCcy = new NumberFormat("#,##0.00", "en_US");

  _itemChoice(choice) {
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Payments".tr(),
              style: TextStyle(
                color: AppColors.textColor,
              )),
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
          builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
            var asyncValue = watch(dashboardMeterDataFutureProvider);

            return asyncValue.when(
                data: (data) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      children: <Widget>[
                        SliderWidget(data),
                        Consumer(
                          builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
                            var paymentController = watch(paymentDataFutureProvider(context.read(counterProvider).state.meterId));
                            return paymentController.when(
                                data: (data) {
                                  final List<Map> _products = List.generate(data.length, (i) {
                                    return {
                                      "Date": DateFormat('d MMMM yyy').format(data.elementAt(i).paymentDate),
                                      "Type": data.elementAt(i).type,
                                      "Receipt": data.elementAt(i).receiptNo,
                                      "Amount":oCcy.format( double.parse(data.elementAt(i).amount.toStringAsFixed(2)))
                                    };
                                  });
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Date'.tr(),
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: ListView.builder(
                                            itemCount: _products.length,
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemBuilder: (c, index) {
                                              return Card(
                                                child: ExpansionTile(
                                                  title: Text(_products.elementAt(index)["Date"],
                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(15.0),
                                                      child: Column(children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Date'.tr(),
                                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 10, right: 10),
                                                              child: Text(":"),
                                                            ),
                                                            Text(_products.elementAt(index)["Date"]),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Type".tr(),
                                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 10, right: 10),
                                                              child: Text(":"),
                                                            ),
                                                            Text(_products.elementAt(index)["Type"]),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Receipt No .'.tr(),
                                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 10, right: 10),
                                                              child: Text(":"),
                                                            ),
                                                            Text(_products.elementAt(index)["Receipt"]),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Amount'.tr(),
                                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 10, right: 10),
                                                              child: Text(":"),
                                                            ),
                                                            Text(_products.elementAt(index)["Amount"]),
                                                          ],
                                                        ),
                                                      ]),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  );

                                },
                                loading: () => Container(
                                      child: Center(child: CircularProgressIndicator()),
                                    ),
                                error: (e, ee) {
                                  print(e.toString());
                                  print(ee.toString());
                                  return SizedBox();
                                });
                          },
                        )
                      ],
                    ),
                  );
                },
                loading: () => Expanded(
                        child: Container(
                      child: Center(child: CircularProgressIndicator()),
                    )),
                error: (e, ee) {
                  print(e.toString());
                  print(ee.toString());
                  return SizedBox();
                });
          },
        ));
  }
}
