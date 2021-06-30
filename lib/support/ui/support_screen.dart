import 'package:flutter/material.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'package:grocery/support/ui/ticket_screen.dart';
import 'dart:math';

import 'package:kf_drawer/kf_drawer.dart';

class SupportScreen extends KFDrawerContent {
  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final List<Map> _products = List.generate(10, (i) {
    return {
      "id": "13-Jun-2021 07:24",
      "name": "Help",
      "price": Random().nextInt(200) + 1,
      "View": "Action",
      "Status": "ACTIVE"
    };
  });

  int _currentSortColumn = 0;
  bool _isAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => TicketScreen()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.white,
                title: Text("Support",style: TextStyle(color: AppColors.textColor,)),
                actions: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (c) => ProfileScreen()));
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
                        color:  AppColors.textColor,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columnSpacing: 20,
                    sortColumnIndex: _currentSortColumn,
                    sortAscending: _isAscending,
                    headingRowColor:
                        MaterialStateProperty.all(Colors.white),
                    columns: [
                      DataColumn(
                          label: Text(
                            'Date',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          onSort: (columnIndex, _) {
                            setState(() {
                              _currentSortColumn = columnIndex;
                              if (_isAscending == true) {
                                _isAscending = false;
                                // sort the product list in Ascending, order by Price
                                _products.sort((productA, productB) =>
                                    productB['price']
                                        .compareTo(productA['price']));
                              } else {
                                _isAscending = true;
                                // sort the product list in Descending, order by Price
                                _products.sort((productA, productB) =>
                                    productA['price']
                                        .compareTo(productB['price']));
                              }
                            });
                          }),
                      DataColumn(label: Text('Type')),
                      DataColumn(label: Text('Description')),
                      DataColumn(label: Text('Status')),
                      DataColumn(
                        label: Text(
                          'Action',
                        ),
                        // Sorting function
                      ),
                    ],
                    rows: _products.map((item) {
                      return DataRow(cells: [
                        DataCell(Text(item['id'].toString())),
                        DataCell(Text(item['name'])),
                        DataCell(Text(item['price'].toString())),
                        DataCell(Text(item['Status'].toString())),
                        DataCell(Text(item['View'].toString()))
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
