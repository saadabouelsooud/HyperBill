import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/dashboard/controller/dashboard_controller.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'package:grocery/support/controller/support_controller.dart';
import 'package:grocery/support/ui/ticket_screen.dart';
import 'package:grocery/support/ui/ticket_view.dart';
import 'package:grocery/widget.dart';
import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:kf_drawer/kf_drawer.dart';

class SupportScreen extends KFDrawerContent {
  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  int _currentSortColumn = 0;
  bool _isAscending = true;

  _itemChoice(choice) {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Support".tr(),
            style: TextStyle(
              color: AppColors.textColor,
            )),
        actions: [
          PopupMenuButton(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/profile.png",
              ),
            ),
            onSelected: _itemChoice,
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
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Consumer(
              builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
                var asyncValue = watch(dashboardMeterDataFutureProvider);
                return asyncValue.when(
                    data: (data) {
                      return ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
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
                                        "Status": data.elementAt(i).status,
                                        "title": data.elementAt(i).title
                                      };
                                    });

                                    return DataTable(
                                      columnSpacing: 5,
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
                                                  _products.sort((productA, productB) => productB['price'].compareTo(productA['price']));
                                                } else {
                                                  _isAscending = true;
                                                  _products.sort((productA, productB) => productA['price'].compareTo(productB['price']));
                                                }
                                              });
                                            }),
                                        DataColumn(label: Text('Type'.tr())),
                                        DataColumn(label: Text('Description'.tr())),
                                        DataColumn(label: Text('Status'.tr())),
                                        DataColumn(
                                          label: Text(
                                            'Action'.tr(),
                                          ),
                                          // Sorting function
                                        ),
                                      ],
                                      rows: _products.map((item) {
                                        return DataRow(cells: [
                                          DataCell(Text(
                                            item['id'].toString(),
                                          )),
                                          DataCell(Text(item['name'], textAlign: TextAlign.center)),
                                          DataCell(Text(item['price'].toString(), textAlign: TextAlign.center)),
                                          DataCell(Text(item['Status'].toString(), textAlign: TextAlign.center)),
                                          DataCell(InkWell(
                                            child: Text(item['View'].toString(), textAlign: TextAlign.center),
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (c) => TicketView(item["name"],item["title"],item["Status"])));
                                            },
                                          ))
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
    );
  }
}
