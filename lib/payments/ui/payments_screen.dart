import 'package:flutter/material.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'package:kf_drawer/kf_drawer.dart';

class PaymentsScreen extends KFDrawerContent {

  @override
  _PaymentsScreenState createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  final List<Map> _products = List.generate(10, (i) {
    return {"Date": "27-May-2021 12:11", "Type": "ONLINE", "Receipt": "270521_10000055", "Amount": "48"};
  });

  int _currentSortColumn = 0;
  bool _isAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Payments"),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(columnSpacing: 15,
                      sortColumnIndex: _currentSortColumn,
                      sortAscending: _isAscending,
                      headingRowColor: MaterialStateProperty.all(Colors.blueGrey[200]),
                      columns: [
                        DataColumn(
                            label: Text(
                              'Date',
                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                            ),
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
                            label: Text('Type'),
                            onSort: (columnIndex, _) {
                              setState(() {
                                _currentSortColumn = columnIndex;
                                if (_isAscending == true) {
                                  _isAscending = false;
                                  // sort the product list in Ascending, order by Price
                                  _products
                                      .sort((productA, productB) => productB['Type'].compareTo(productA['Type']));
                                } else {
                                  _isAscending = true;
                                  // sort the product list in Descending, order by Price
                                  _products
                                      .sort((productA, productB) => productA['Type'].compareTo(productB['Type']));
                                }
                              });
                            }),
                        DataColumn(
                            label: Text('Receipt No .'),
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
                            label: Text('Amount'),
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
                          DataCell(Text(item['Date'].toString())),
                          DataCell(Text(item['Type'])),
                          DataCell(Text(item['Receipt'].toString())),
                          DataCell(Text(item['Amount'].toString())),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
