
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/core/services/theme/styles/styles.dart';
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
  final List<Map> _products = List.generate(10, (i) {
    return {"Month": "Jan-2021", "Date": "01-Feb-2021", "KWh": "935.042", "Amount": "1,128.349"};
  });
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
          title: Text("Consumptions"),
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              SliderWidget(1),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green),
                        child: LineChart(
                          insidePadding: 50,
                          width: MediaQuery.of(context).size.width * .9,
                          // Width size of chart
                          height: 180,
                          // Height size of chart
                          data: [
                            LineChartModel(
                              amount: 110,
                              date: DateTime(2020, 1, 9),
                            ),
                            LineChartModel(amount: 250, date: DateTime(2020, 2, 10)),
                            LineChartModel(amount: 390, date: DateTime(2020, 3, 11)),
                            LineChartModel(amount: 1300, date: DateTime(2020, 4, 12)),
                            LineChartModel(amount: 800, date: DateTime(2020, 5, 5)),
                          ],
                          // The value to the chart
                          linePaint: Paint()
                            ..strokeWidth = 3
                            ..style = PaintingStyle.stroke
                            ..color = Colors.black,
                          // Custom paint for the line
                          circlePaint: Paint()..color = Colors.black,
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
                            color: Colors.white,
                          ),
                          // Your line pointer decoration,
                          pointerDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
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
                          onDropPointer: () {
                          }, // This callback is called when it is on the pointer and removes your finger from the screen
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
                                style: TextStyles.largeHintHeaderStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                               "Consumption "+ consumptionsDate,
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
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green),
                        child: LineChart(
                          insidePadding: 50,

                          width: MediaQuery.of(context).size.width * .9,
                          // Width size of chart
                          height: 180,
                          // Height size of chart
                          data: [
                            LineChartModel(amount: 300, date: DateTime(2020, 1, 1)),
                            LineChartModel(amount: 200, date: DateTime(2020, 2, 2)),
                            LineChartModel(amount: 300, date: DateTime(2020, 3, 3)),
                            LineChartModel(amount: 500, date: DateTime(2020, 4, 4)),
                            LineChartModel(amount: 800, date: DateTime(2020, 5, 5)),
                          ],
                          // The value to the chart
                          linePaint: Paint()
                            ..strokeWidth = 3
                            ..style = PaintingStyle.stroke
                            ..color = Colors.black,
                          // Custom paint for the line
                          circlePaint: Paint()..color = Colors.black,
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
                            color: Colors.white,
                          ),
                          // Your line pointer decoration,
                          pointerDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
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
                          onDropPointer: () {
                          }, // This callback is called when it is on the pointer and removes your finger from the screen
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
                                style: TextStyles.largeHintHeaderStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Amount "+ amountDate,
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
                  child: DataTable(
                    columnSpacing: 15,
                    sortColumnIndex: _currentSortColumn,
                    sortAscending: _isAscending,
                    headingRowColor: MaterialStateProperty.all(Colors.blueGrey[200]),
                    columns: [
                      DataColumn(
                          label: Text(
                            'Month',
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                          onSort: (columnIndex, _) {
                            setState(() {
                              _currentSortColumn = columnIndex;
                              if (_isAscending == true) {
                                _isAscending = false;
                                // sort the product list in Ascending, order by Price
                                _products
                                    .sort((productA, productB) => productB['Month'].compareTo(productA['Month']));
                              } else {
                                _isAscending = true;
                                // sort the product list in Descending, order by Price
                                _products
                                    .sort((productA, productB) => productA['Month'].compareTo(productB['Month']));
                              }
                            });
                          }),
                      DataColumn(
                          label: Text('Reading Date'),
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
                          label: Text('Amount EGP'),
                          onSort: (columnIndex, _) {
                            setState(() {
                              _currentSortColumn = columnIndex;
                              if (_isAscending == true) {
                                _isAscending = false;
                                // sort the product list in Ascending, order by Price
                                _products
                                    .sort((productA, productB) => productB['Amount'].compareTo(productA['Amount']));
                              } else {
                                _isAscending = true;
                                // sort the product list in Descending, order by Price
                                _products
                                    .sort((productA, productB) => productA['Amount'].compareTo(productB['Amount']));
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
          ),
        ));
  }
}
