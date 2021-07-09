import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/dashboard/controller/dashboard_controller.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'package:grocery/support/controller/support_controller.dart';
import 'package:grocery/support/ui/ticket_screen.dart';
import 'package:grocery/widget.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:kf_drawer/kf_drawer.dart';

class SupportScreen extends KFDrawerContent {
  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  int _currentSortColumn = 0;
  bool _isAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => TicketScreen()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: [
              AppBar(
                backgroundColor: Colors.white,
                title: Text("Support",
                    style: TextStyle(
                      color: AppColors.textColor,
                    )),
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Consumer(
                  builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
                    var asyncValue = watch(dashboardMeterDataFutureProvider);
                    return asyncValue.when(
                        data: (data) {
                          return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              SliderWidget(data),
                              Consumer(
                                builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
                                  var asyncValue2 = watch(supportDataFutureProvider);
                                  return asyncValue2.when(
                                      data: (data) {
                                        final List<Map> _products = List.generate(data.length, (i) {
                                          return {
                                            "id": DateFormat('dd-MMM-yyyy hh:mm').format(data.elementAt(i).createdDate),
                                            "name": data.elementAt(i).type,
                                            "price": data.elementAt(i).description,
                                            "View": "Action",
                                            "Status": data.elementAt(i).status
                                          };
                                        });

                                        return DataTable(
                                          columnSpacing: 20,
                                          sortColumnIndex: _currentSortColumn,
                                          sortAscending: _isAscending,
                                          headingRowColor: MaterialStateProperty.all(Colors.white),
                                          columns: [
                                            DataColumn(
                                                label: Text(
                                                  'Date',
                                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                                onSort: (columnIndex, _) {
                                                  setState(() {
                                                    _currentSortColumn = columnIndex;
                                                    if (_isAscending == true) {
                                                      _isAscending = false;
                                                      // sort the product list in Ascending, order by Price
                                                      _products.sort((productA, productB) => productB['price'].compareTo(productA['price']));
                                                    } else {
                                                      _isAscending = true;
                                                      // sort the product list in Descending, order by Price
                                                      _products.sort((productA, productB) => productA['price'].compareTo(productB['price']));
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
                                        );
                                      },
                                      loading: () => Center(child: CircularProgressIndicator()),
                                      error: (e, ee) {
                                        print(e.toString());
                                        print(ee.toString());
                                        return SizedBox();
                                      });
                                },
                              )
                            ],
                          );
                        },
                        loading: () => Center(child: CircularProgressIndicator()),
                        error: (e, ee) => Text(e.toString()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
