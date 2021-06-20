import 'package:flutter/material.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'dart:math';

import 'package:kf_drawer/kf_drawer.dart';

class SupportScreen extends KFDrawerContent {
  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final List<Map> _products = List.generate(10, (i) {
    return {"id": "13-Jun-2021 07:24", "name": "Help", "price": Random().nextInt(200) + 1,"View":"Action","Status":"ACTIVE"};
  });

  int _currentSortColumn = 0;
  bool _isAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {  },child:Icon( Icons.add),),
      body: Container(
        child: Center(
          child: Column(
            children: [
              AppBar(
                title: Text("Support"),actions: [
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
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        sortColumnIndex: _currentSortColumn,
                        sortAscending: _isAscending,
                        headingRowColor: MaterialStateProperty.all(Colors.blueGrey[200]),
                        columns: [
                          DataColumn(
                              label: Text('Date',  style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),),
                              onSort: (columnIndex, _) {
                                setState(() {
                                  _currentSortColumn = columnIndex;
                                  if (_isAscending == true) {
                                    _isAscending = false;
                                    // sort the product list in Ascending, order by Price
                                    _products
                                        .sort((productA, productB) => productB['price'].compareTo(productA['price']));
                                  } else {
                                    _isAscending = true;
                                    // sort the product list in Descending, order by Price
                                    _products
                                        .sort((productA, productB) => productA['price'].compareTo(productB['price']));
                                  }
                                });
                              }),
                          DataColumn(label: Text('Type')),
                          DataColumn(label: Text('Description')),
                          DataColumn(label: Text('Status')),
                          DataColumn(label: Text('Action',),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
