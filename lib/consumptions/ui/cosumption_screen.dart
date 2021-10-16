import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/consumptions/controller/consumption_controller.dart';
import 'package:grocery/core/services/theme/styles/styles.dart';
import 'package:grocery/dashboard/controller/dashboard_controller.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'package:grocery/widget.dart';
import 'package:intl/intl.dart';
import 'package:line_chart/charts/line-chart.widget.dart';
import 'package:line_chart/model/line-chart.model.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../drawer_lib.dart';

class ConsumptionsScreen extends KFDrawerContent {
  @override
  _ConsumptionsState createState() => _ConsumptionsState();
}

class _ConsumptionsState extends State<ConsumptionsScreen> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
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

  String amountText;

  String amountDate;

  String consumptionsText;

  String consumptionsDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Consumptions".tr(),
            style: TextStyle(color: AppColors.textColor),
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
                          builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watc, Widget child) {
                            var asyncValue = watch(
                                consumptionDataFutureProvider(context.read(counterProvider).state.meterId.toString()));
                            String lang;
                            if (EasyLocalization.of(context).locale == Locale('ar', "")) {
                              lang = "ar";
                            } else {
                              lang = "en";
                            }
                            return asyncValue.when(
                                data: (data) {
                                  if (amountText == null) {
                                    var d = data.first.amount / 1000;
                                    amountText = oCcy.format(double.parse(d.toStringAsFixed(2))) + "  " + "EGP".tr();
                                    amountDate = DateFormat('MMM').format(data.first.readingDate);
                                    consumptionsText = data.first.consumption.toStringAsFixed(2) + "  " + "KWh".tr();
                                    consumptionsDate = DateFormat('MMM').format(data.first.readingDate);
                                  }
                                  final List<Map> _products = List.generate(data.length, (i) {
                                    var amount = data.elementAt(i).amount / 1000;
                                    return {
                                      "Month": DateFormat('MMM-yyyy',lang).format(data.elementAt(i).consumptionMonth),
                                      "Date": DateFormat('d MMMM yyy', lang).format(data.elementAt(i).readingDate),
                                      "KWh": data.elementAt(i).consumption.toStringAsFixed(2),
                                      "Amount": oCcy.format(double.parse(amount.toStringAsFixed(2)))
                                    };
                                  });

                                  return Column(
                                    children: [
                                      Card(
                                        elevation: 5,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15, right: 15),                                              child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.transparent),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      consumptionsText,
                                                      style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                        fontFamily: "Schyler",
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Consumptions".tr() + " " + consumptionsDate,
                                                      style: TextStyles.largeHintHeaderStyle,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white,
                                              ),
                                              child: LineChart(
                                                insidePadding: 50,
                                                width: MediaQuery.of(context).size.width * .9,
                                                // Width size of chart
                                                height: 100,
                                                // Height size of chart
                                                data: data
                                                    .map((e) => LineChartModel(
                                                        amount: double.parse(e.consumption.toString()),
                                                        date: e.readingDate))
                                                    .toList(),
                                                // The value to the chart
                                                linePaint: Paint()
                                                  ..strokeWidth = 3
                                                  ..style = PaintingStyle.stroke
                                                  ..color = Colors.green,
                                                // Custom paint for the line
                                                circlePaint: Paint()..color = Colors.green,
                                                // Custom paint for the line
                                                showPointer: true,
                                                // When press or pan update the chart, create a pointer in approximated value (The default is true)
                                                showCircles: true,
                                                // Show the circle in every value of chart
                                                customDraw: (Canvas canvas, Size size) {},
                                                // You can draw anything in your chart, this callback is called when is generating the chart
                                                circleRadiusValue: 6,
                                                // The radius value of circle
                                                linePointerDecoration: BoxDecoration(
                                                  color: Colors.green,
                                                ),
                                                // Your line pointer decoration,
                                                pointerDecoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.green,
                                                ),
                                                // Your decoration of circle pointer,
                                                insideCirclePaint: Paint()..color = Colors.white,
                                                // On your circle of the chart, have a second circle, which is inside and a slightly smaller size.
                                                onValuePointer: (value) {
                                                  setState(() {
                                                    consumptionsText =
                                                        value.chart.amount.toStringAsFixed(2) + "  " + "KWh".tr();
                                                    consumptionsDate = DateFormat('MMM').format(value.chart.date);
                                                  });
                                                },
                                                // This callback is called when change the pointer,
                                                onDropPointer:
                                                    () {}, // This callback is called when it is on the pointer and removes your finger from the screen
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                      Card(
                                        elevation: 5,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15, right: 15),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: Colors.transparent),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        amountText,
                                                        style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                          fontFamily: "Schyler",
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "Amount".tr() + " " + amountDate,
                                                        style: TextStyles.largeHintHeaderStyle,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white,
                                              ),
                                              child: LineChart(
                                                insidePadding: 50,
                                                width: MediaQuery.of(context).size.width * .9,
                                                // Width size of chart
                                                height: 100,
                                                // Height size of chart
                                                data: data
                                                    .map((e) => LineChartModel(
                                                        amount: double.parse(e.amount.toString()), date: e.readingDate))
                                                    .toList(),

                                                // The value to the chart
                                                linePaint: Paint()
                                                  ..strokeWidth = 3
                                                  ..style = PaintingStyle.stroke
                                                  ..color = Colors.green,
                                                // Custom paint for the line
                                                circlePaint: Paint()..color = Colors.green,
                                                // Custom paint for the line
                                                showPointer: true,
                                                // When press or pan update the chart, create a pointer in approximated value (The default is true)
                                                showCircles: true,
                                                // Show the circle in every value of chart
                                                customDraw: (Canvas canvas, Size size) {},
                                                // You can draw anything in your chart, this callback is called when is generating the chart
                                                circleRadiusValue: 6,
                                                // The radius value of circle
                                                linePointerDecoration: BoxDecoration(
                                                  color: Colors.green,
                                                ),
                                                // Your line pointer decoration,
                                                pointerDecoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.green,
                                                ),
                                                // Your decoration of circle pointer,
                                                insideCirclePaint: Paint()..color = Colors.white,
                                                // On your circle of the chart, have a second circle, which is inside and a slightly smaller size.
                                                onValuePointer: (value) {
                                                  setState(() {
                                                    var amount = value.chart.amount / 1000;
                                                    amountText = oCcy.format(double.parse(amount.toStringAsFixed(2))) +
                                                        "  " +
                                                        "EGP".tr();
                                                    amountDate = DateFormat('MMM').format(value.chart.date);
                                                  });
                                                },
                                                // This callback is called when change the pointer,
                                                onDropPointer:
                                                    () {}, // This callback is called when it is on the pointer and removes your finger from the screen
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Reading Date".tr(),
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
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.all(15.0),
                                                          child: Column(children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  'Month'.tr(),
                                                                  style: TextStyle(
                                                                      color: Colors.black, fontWeight: FontWeight.bold),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                                                  child: Text(":"),
                                                                ),
                                                                Text(_products.elementAt(index)["Month"]),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Reading Date".tr(),
                                                                  style: TextStyle(
                                                                      color: Colors.black, fontWeight: FontWeight.bold),
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
                                                                  'KWh'.tr(),
                                                                  style: TextStyle(
                                                                      color: Colors.black, fontWeight: FontWeight.bold),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                                                  child: Text(":"),
                                                                ),
                                                                Text(_products.elementAt(index)["KWh"]),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  'Amount'.tr(),
                                                                  style: TextStyle(
                                                                      color: Colors.black, fontWeight: FontWeight.bold),
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
                                      ),
                                    ],
                                  );
                                },
                                loading: () => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                error: (e, ee) {
                                  print(ee.toString());
                                  return Center(
                                    child: Text(e.toString()),
                                  );
                                });
                          },
                        ),
                      ],
                    ),
                  );
                },
                loading: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                error: (e, ee) {
                  print(ee.toString());
                  return Center(
                    child: Text(e.toString()),
                  );
                });
          },
        ));
  }
}
