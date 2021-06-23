import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:grocery/consumptions/ui/chart.dart';
import 'package:grocery/core/services/theme/styles/styles.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'package:kf_drawer/kf_drawer.dart';

class ConsumptionsScreen extends KFDrawerContent {
  @override
  _ConsumptionsState createState() => _ConsumptionsState();
}

class _ConsumptionsState extends State<ConsumptionsScreen> {
  final List<Map> _products = List.generate(10, (i) {
    return {"Month": "Jan-2021", "Date": "01-Feb-2021", "KWh": "935.042", "Amount": "1,128.349"};
  });

  int _currentSortColumn = 0;
  bool _isAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Consumptions"),
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  PieChartSample2(),
                  Text(
                    "Consumption ",
                    style: TextStyles.largeHintHeaderStyle,
                  ),
                ],
              ),
              Column(
                children: [
                  PieChartSample2(),
                  Text("Amount EGP " ,style: TextStyles.largeHintHeaderStyle,),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: DataTable(columnSpacing: 15,
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
                                _products
                                    .sort((productA, productB) => productB['Date'].compareTo(productA['Date']));
                              } else {
                                _isAscending = true;
                                // sort the product list in Descending, order by Price
                                _products
                                    .sort((productA, productB) => productA['Date'].compareTo(productB['Date']));
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
