import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/dashboard/controller/dashboard_controller.dart';
import 'package:grocery/payments/controller/payment_controller.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'package:intl/intl.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../widget.dart';

class PaymentsScreen extends KFDrawerContent {
  @override
  _PaymentsScreenState createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  int _currentSortColumn = 0;
  bool _isAscending = true;

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
                          builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
                            var paymentController = watch(paymentDataFutureProvider(context.read(counterProvider).state));
                            return paymentController.when(
                                data: (data) {
                                  final List<Map> _products = List.generate(data.length, (i) {
                                    return {
                                      "Date": DateFormat('dd-MMM-yyyy hh:mm').format(data.elementAt(i).paymentDate),
                                      "Type": data.elementAt(i).type,
                                      "Receipt": data.elementAt(i).receiptNo,
                                      "Amount": data.elementAt(i).amount
                                    };
                                  });
                                  return Expanded(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: DataTable(
                                          columnSpacing: 10,
                                          sortColumnIndex: _currentSortColumn,
                                          sortAscending: _isAscending,
                                          headingRowColor: MaterialStateProperty.all(Colors.white),
                                          columns: [
                                            DataColumn(
                                                label: Text(
                                                  'Date'.tr(),
                                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                                                label: Text('Type'.tr()),
                                                onSort: (columnIndex, _) {
                                                  setState(() {
                                                    _currentSortColumn = columnIndex;
                                                    if (_isAscending == true) {
                                                      _isAscending = false;
                                                      // sort the product list in Ascending, order by Price
                                                      _products.sort((productA, productB) => productB['Type'].compareTo(productA['Type']));
                                                    } else {
                                                      _isAscending = true;
                                                      // sort the product list in Descending, order by Price
                                                      _products.sort((productA, productB) => productA['Type'].compareTo(productB['Type']));
                                                    }
                                                  });
                                                }),
                                            DataColumn(
                                                label: Text('Receipt No .'.tr()),
                                                onSort: (columnIndex, _) {
                                                  setState(() {
                                                    _currentSortColumn = columnIndex;
                                                    if (_isAscending == true) {
                                                      _isAscending = false;
                                                      // sort the product list in Ascending, order by Price
                                                      _products.sort((productA, productB) => productB['Receipt'].compareTo(productA['Receipt']));
                                                    } else {
                                                      _isAscending = true;
                                                      // sort the product list in Descending, order by Price
                                                      _products.sort((productA, productB) => productA['Receipt'].compareTo(productB['Receipt']));
                                                    }
                                                  });
                                                }),
                                            DataColumn(
                                                label: Text('Amount'.tr()),
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
                                              DataCell(Text(item['Date'].toString())),
                                              DataCell(Text(item['Type'])),
                                              DataCell(Text(item['Receipt'].toString())),
                                              DataCell(Text(item['Amount'].toString())),
                                            ]);
                                          }).toList(),
                                        ),
                                      ),
                                    ),
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
                  return SizedBox();});
          },
        ));
  }
}
