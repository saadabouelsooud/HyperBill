import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/consumptions/controller/consumption_controller.dart';
import 'package:grocery/core/services/theme/styles/styles.dart';
import 'package:grocery/dashboard/controller/dashboard_controller.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'package:grocery/widget.dart';
import 'package:intl/intl.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:line_chart/charts/line-chart.widget.dart';
import 'package:line_chart/model/line-chart.model.dart';

class ConsumptionsScreen extends KFDrawerContent {
  @override
  _ConsumptionsState createState() => _ConsumptionsState();
}

class _ConsumptionsState extends State<ConsumptionsScreen> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentSortColumn = 0;
  bool _isAscending = true;
  String amountText = "300 Eg";
  String amountDate = "jan";
  String consumptionsText = "1300 KWh";
  String consumptionsDate = "jan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Consumptions",
            style: TextStyle(color: AppColors.textColor),
          ),
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
                            var asyncValue = watch(consumptionDataFutureProvider(context.read(counterProvider).state.toString()));

                            return asyncValue.when(
                                data: (data) {
                                  final List<Map> _products = List.generate(data.length, (i) {
                                    return {
                                      "Month": DateFormat('MMM-yyyy ').format(data.elementAt(i).consumptionMonth) ,
                                      "Date":DateFormat('yyyy-MMM-dd ').format(data.elementAt(i).readingDate) ,
                                      "KWh": data.elementAt(i).consumption,
                                      "Amount": data.elementAt(i).amount
                                    };
                                  });
                                  return Column(
                                    children: [
                                      Column(
                                        children: [
                                          Stack(
                                            children: [
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
                                                  height: 180,
                                                  // Height size of chart
                                                  data: data
                                                      .map((e) => LineChartModel(amount: double.parse(e.amount.toString()), date: e.readingDate))
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
                                                      consumptionsText = value.chart.amount.toString() + "  KWh";
                                                      consumptionsDate = DateFormat('MMM').format(value.chart.date);
                                                    });
                                                  },
                                                  // This callback is called when change the pointer,
                                                  onDropPointer:
                                                      () {}, // This callback is called when it is on the pointer and removes your finger from the screen
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Container(
                                                  margin: EdgeInsets.all(30),
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        consumptionsText,
                                                        style: TextStyles.largeHintHeaderStyleBold,
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "Consumption " + consumptionsDate,
                                                        style: TextStyles.largeHintHeaderStyle,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Stack(
                                            children: [
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
                                                  height: 180,
                                                  // Height size of chart
                                                  data: data
                                                      .map((e) => LineChartModel(amount: double.parse(e.consumption.toString()), date: e.readingDate))
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
                                                      amountText = value.chart.amount.toString() + " Eg";
                                                      amountDate = DateFormat('MMM').format(value.chart.date);
                                                    });
                                                  },
                                                  // This callback is called when change the pointer,
                                                  onDropPointer:
                                                      () {}, // This callback is called when it is on the pointer and removes your finger from the screen
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Container(
                                                  margin: EdgeInsets.all(30),
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        amountText,
                                                        style: TextStyles.largeHintHeaderStyleBold,
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "Amount " + amountDate,
                                                        style: TextStyles.largeHintHeaderStyle,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        child: SingleChildScrollView(
                                          physics: NeverScrollableScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          child: DataTable(headingRowHeight: 60,
                                            columnSpacing: 17,
                                            sortColumnIndex: _currentSortColumn,
                                            sortAscending: _isAscending,
                                            headingRowColor: MaterialStateProperty.all(Colors.white),
                                            columns: [
                                              DataColumn(
                                                  label: Text(
                                                    'Month',
                                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                  ),
                                                  onSort: (columnIndex, _) {
                                                    setState(() {
                                                      _currentSortColumn = columnIndex;
                                                      if (_isAscending == true) {
                                                        _isAscending = false;
                                                        // sort the product list in Ascending, order by Price
                                                        _products.sort((productA, productB) => productB['Month'].compareTo(productA['Month']));
                                                      } else {
                                                        _isAscending = true;
                                                        // sort the product list in Descending, order by Price
                                                        _products.sort((productA, productB) => productA['Month'].compareTo(productB['Month']));
                                                      }
                                                    });
                                                  }),
                                              DataColumn(
                                                  label: Column(mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text('Reading '),
                                                      Text(' Date'),
                                                    ],
                                                  ),
                                                  onSort: (columnIndex, _) {
                                                    setState(() {
                                                      _currentSortColumn = columnIndex;
                                                      if (_isAscending == true) {
                                                        _isAscending = false;
                                                        // sort the product list in Ascending, order by Price
                                                        _products.sort((productA, productB) => productB['Date'].compareTo(productA['Date']));
                                                      } else {
                                                        _isAscending = true;
                                                        // sort the product list in Descending, order by Price
                                                        _products.sort((productA, productB) => productA['Date'].compareTo(productB['Date']));
                                                      }
                                                    });
                                                  }),
                                              DataColumn(
                                                  label: Text('KWh'),
                                                  onSort: (columnIndex, _) {
                                                    setState(() {
                                                      _currentSortColumn = columnIndex;
                                                      if (_isAscending == true) {
                                                        _isAscending = false;
                                                        // sort the product list in Ascending, order by Price
                                                        _products.sort((productA, productB) => productB['KWh'].compareTo(productA['KWh']));
                                                      } else {
                                                        _isAscending = true;
                                                        // sort the product list in Descending, order by Price
                                                        _products.sort((productA, productB) => productA['KWh'].compareTo(productB['KWh']));
                                                      }
                                                    });
                                                  }),
                                              DataColumn(
                                                  label: Column(mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text('Amount'),
                                                      Text(' EGP'),
                                                    ],
                                                  ),
                                                  onSort: (columnIndex, _) {
                                                    setState(() {
                                                      _currentSortColumn = columnIndex;
                                                      if (_isAscending == true) {
                                                        _isAscending = false;
                                                        // sort the product list in Ascending, order by Price
                                                        _products.sort((productA, productB) => productB['Amount'].compareTo(productA['Amount']));
                                                      } else {
                                                        _isAscending = true;
                                                        // sort the product list in Descending, order by Price
                                                        _products.sort((productA, productB) => productA['Amount'].compareTo(productB['Amount']));
                                                      }
                                                    });
                                                  }),
                                              // Sorting function
                                            ],
                                            rows: _products.map((item) {
                                              return DataRow(cells: [
                                                DataCell(Text(item['Month'].toString())),
                                                DataCell(Text(item['Date'])),
                                                DataCell(Text(item['KWh'].toString())),
                                                DataCell(Text(item['Amount'].toString())),
                                              ]);
                                            }).toList(),
                                          ),
                                        ),
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
