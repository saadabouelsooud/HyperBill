import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/dashboard/controller/dashboard_controller.dart';
import 'package:grocery/prices/controller/prices_controller.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'package:grocery/widget.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:easy_localization/easy_localization.dart';

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
      if (EasyLocalization.of(context).locale == Locale('ar', "DZ")) {
        EasyLocalization.of(context).setLocale(Locale('en', "US"));

      } else {
        EasyLocalization.of(context).setLocale(Locale('ar', "DZ"));
      }
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

      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
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
                                var pricesController = watch(pricesDataFutureProvider(context.read(counterProvider).state));
                                return pricesController.when(
                                    data: (data) {
                                      final List<Map> _products = List.generate(data.length, (i) {
                                        return {
                                          "From": data.elementAt(i).elementAt(4) != null ? data.elementAt(i).elementAt(4) : "",
                                          "To": data.elementAt(i).elementAt(5) != null ? data.elementAt(i).elementAt(5) : "",
                                          "Rate": data.elementAt(i).elementAt(6) != null ? data.elementAt(i).elementAt(6) : "",
                                          "Service": data.elementAt(i).elementAt(7) != null ? data.elementAt(i).elementAt(7) : "",
                                          "Extra": data.elementAt(i).elementAt(8) != null ? data.elementAt(i).elementAt(8) : ""
                                        };
                                      });
                                      return DataTable(
                                        columnSpacing: .1,
                                        sortColumnIndex: _currentSortColumn,
                                        sortAscending: _isAscending,
                                        headingRowColor: MaterialStateProperty.all(Colors.white),
                                        columns: [
                                          DataColumn(
                                              label: Text(
                                                'From'.tr(),
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                              ),
                                              onSort: (columnIndex, _) {
                                                setState(() {
                                                  _currentSortColumn = columnIndex;
                                                  if (_isAscending == true) {
                                                    _isAscending = false;
                                                    // sort the product list in Ascending, order by Price
                                                    _products.sort((productA, productB) => productB['From'].compareTo(productA['From']));
                                                  } else {
                                                    _isAscending = true;
                                                    // sort the product list in Descending, order by Price
                                                    _products.sort((productA, productB) => productA['From'].compareTo(productB['From']));
                                                  }
                                                });
                                              }),
                                          DataColumn(
                                              label: Text('To'.tr()),
                                              onSort: (columnIndex, _) {
                                                setState(() {
                                                  _currentSortColumn = columnIndex;
                                                  if (_isAscending == true) {
                                                    _isAscending = false;
                                                    // sort the product list in Ascending, order by Price
                                                    _products.sort((productA, productB) => productB['To'].compareTo(productA['To']));
                                                  } else {
                                                    _isAscending = true;
                                                    // sort the product list in Descending, order by Price
                                                    _products.sort((productA, productB) => productA['To'].compareTo(productB['To']));
                                                  }
                                                });
                                              }),
                                          DataColumn(
                                              label: Text('Rate'.tr()),
                                              onSort: (columnIndex, _) {
                                                setState(() {
                                                  _currentSortColumn = columnIndex;
                                                  if (_isAscending == true) {
                                                    _isAscending = false;
                                                    // sort the product list in Ascending, order by Price
                                                    _products.sort((productA, productB) => productB['Rate'].compareTo(productA['Rate']));
                                                  } else {
                                                    _isAscending = true;
                                                    // sort the product list in Descending, order by Price
                                                    _products.sort((productA, productB) => productA['Rate'].compareTo(productB['Rate']));
                                                  }
                                                });
                                              }),
                                          DataColumn(
                                              label: Text(
                                                'Service'.tr(),
                                              ),
                                              onSort: (columnIndex, _) {
                                                setState(() {
                                                  _currentSortColumn = columnIndex;
                                                  if (_isAscending == true) {
                                                    _isAscending = false;
                                                    // sort the product list in Ascending, order by Price
                                                    _products.sort((productA, productB) => productB['Service'].compareTo(productA['Service']));
                                                  } else {
                                                    _isAscending = true;
                                                    // sort the product list in Descending, order by Price
                                                    _products.sort((productA, productB) => productA['Service'].compareTo(productB['Service']));
                                                  }
                                                });
                                              }),
                                          DataColumn(
                                              label: Text(
                                                'Extra'.tr(),
                                              ),
                                              onSort: (columnIndex, _) {
                                                setState(() {
                                                  _currentSortColumn = columnIndex;
                                                  if (_isAscending == true) {
                                                    _isAscending = false;
                                                    // sort the product list in Ascending, order by Price
                                                    _products.sort((productA, productB) => productB['Extra'].compareTo(productA['Extra']));
                                                  } else {
                                                    _isAscending = true;
                                                    // sort the product list in Descending, order by Price
                                                    _products.sort((productA, productB) => productA['Extra'].compareTo(productB['Extra']));
                                                  }
                                                });
                                              }
                                              // Sorting function
                                              ),
                                        ],
                                        rows: _products.map((item) {
                                          return DataRow(cells: [
                                            DataCell(Text(item['From'].toString() + " KWh")),
                                            DataCell(Text(item['To'].toString() + " KWh")),
                                            DataCell(Text(item['Rate'].toString() + " EGP")),
                                            DataCell(Text(item['Service'].toString() + " EGP")),
                                            DataCell(Text(item['Extra'].toString() + " EGP"))
                                          ]);
                                        }).toList(),
                                      );
                                    },
                                    loading: () => Center(
                                          child: CircularProgressIndicator(),
                                        ),
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
                      loading: () => Center(
                            child: CircularProgressIndicator(),
                          ),
                      error: (e, ee) {
                        print(e.toString());
                        print(ee.toString());
                        return SizedBox();
                      });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
