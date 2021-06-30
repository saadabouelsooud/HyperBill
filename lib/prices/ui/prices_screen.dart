
import 'package:flutter/material.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'package:kf_drawer/kf_drawer.dart';

class PricesScreen extends KFDrawerContent {
  @override
  _PricesScreenState createState() => _PricesScreenState();
}

class _PricesScreenState extends State<PricesScreen> {
  final List<Map> _products = [
    {"From": "0 ", "To": "50 ", "Rate": "0.38 ", "Service": "1 ", "Extra": "0 "},
    {"From": "50 ", "To": "100 ", "Rate": "0.48 ", "Service": "2 ", "Extra": "0 "},
    {"From": "100 ", "To": "200 ", "Rate": "0.65 ", "Service": "6 ", "Extra": "22 "},
    {"From": "200 ", "To": "350 ", "Rate": "0.96 ", "Service": "11 ", "Extra": "0 "},
    {"From": "350 ", "To": "650 ", "Rate": "0.38 ", "Service": "1.18 ", "Extra": "0 "},
    {"From": "650 ", "To": "1000 ", "Rate": "1.18 ", "Service": "25 ", "Extra": "139 "},
    {"From": "1000 ", "To": " ", "Rate": "1.45 ", "Service": "40 ", "Extra": "270 "},
  ];

  int _currentSortColumn = 0;
  bool _isAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Center(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.white,
                title: Text("Prices",style: TextStyle(color: AppColors.textColor,)),actions: [
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
                        color:  AppColors.textColor,
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
                    child: DataTable(
                      columnSpacing: 10,
                      sortColumnIndex: _currentSortColumn,
                      sortAscending: _isAscending,
                      headingRowColor: MaterialStateProperty.all(Colors.blueGrey[200]),
                      columns: [
                        DataColumn(
                            label: Text(
                              'From',
                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                            ),
                            onSort: (columnIndex, _) {
                              setState(() {
                                _currentSortColumn = columnIndex;
                                if (_isAscending == true) {
                                  _isAscending = false;
                                  // sort the product list in Ascending, order by Price
                                  _products
                                      .sort((productA, productB) => productB['From'].compareTo(productA['From']));
                                } else {
                                  _isAscending = true;
                                  // sort the product list in Descending, order by Price
                                  _products
                                      .sort((productA, productB) => productA['From'].compareTo(productB['From']));
                                }
                              });
                            }),
                        DataColumn(
                            label: Text('To'),
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
                            label: Text(' Rate'),
                            onSort: (columnIndex, _) {
                              setState(() {
                                _currentSortColumn = columnIndex;
                                if (_isAscending == true) {
                                  _isAscending = false;
                                  // sort the product list in Ascending, order by Price
                                  _products
                                      .sort((productA, productB) => productB['Rate'].compareTo(productA['Rate']));
                                } else {
                                  _isAscending = true;
                                  // sort the product list in Descending, order by Price
                                  _products
                                      .sort((productA, productB) => productA['Rate'].compareTo(productB['Rate']));
                                }
                              });
                            }),
                        DataColumn(
                            label: Text('Service',),
                            onSort: (columnIndex, _) {
                              setState(() {
                                _currentSortColumn = columnIndex;
                                if (_isAscending == true) {
                                  _isAscending = false;
                                  // sort the product list in Ascending, order by Price
                                  _products.sort(
                                      (productA, productB) => productB['Service'].compareTo(productA['Service']));
                                } else {
                                  _isAscending = true;
                                  // sort the product list in Descending, order by Price
                                  _products.sort(
                                      (productA, productB) => productA['Service'].compareTo(productB['Service']));
                                }
                              });
                            }),
                        DataColumn(
                            label: Text(
                              'Extra',
                            ),
                            onSort: (columnIndex, _) {
                              setState(() {
                                _currentSortColumn = columnIndex;
                                if (_isAscending == true) {
                                  _isAscending = false;
                                  // sort the product list in Ascending, order by Price
                                  _products
                                      .sort((productA, productB) => productB['Extra'].compareTo(productA['Extra']));
                                } else {
                                  _isAscending = true;
                                  // sort the product list in Descending, order by Price
                                  _products
                                      .sort((productA, productB) => productA['Extra'].compareTo(productB['Extra']));
                                }
                              });
                            }
                            // Sorting function
                            ),
                      ],
                      rows: _products.map((item) {
                        return DataRow(cells: [
                          DataCell(Text(item['From'].toString() + "KWh")),
                          DataCell(Text(item['To'].toString() + "KWh")),
                          DataCell(Text(item['Rate'].toString() + "EGP")),
                          DataCell(Text(item['Service'].toString() + "EGP")),
                          DataCell(Text(item['Extra'].toString() + "EGP"))
                        ]);
                      }).toList(),
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
