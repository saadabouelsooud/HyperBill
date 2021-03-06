import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/dashboard/controller/dashboard_controller.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'package:grocery/support/controller/support_controller.dart';
import 'package:grocery/support/model/ticket_model.dart';
import 'package:grocery/support/ui/ticket_screen.dart';
import 'package:grocery/support/ui/ticket_view.dart';
import 'package:grocery/widget.dart';
import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../drawer_lib.dart';

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
      setState(() {
        if (EasyLocalization.of(context).locale == Locale('ar', "")) {
          EasyLocalization.of(context).setLocale(Locale('en', ""));
        } else {
          EasyLocalization.of(context).setLocale(Locale('ar', ""));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => TicketScreen())).then((value) {
            setState(() {
              supportDataFutureProvider =
                  FutureProvider.autoDispose<List<Ticket>>((ref) => ref.watch(supportControllerProvider).getSupportData());
            });
          });
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
      body: Container(
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
                                    "id": DateFormat('d MMMM yyy').format(data.elementAt(i).createdDate),
                                    "name": data.elementAt(i).type,
                                    "price": data.elementAt(i).description,
                                    "View": "Action",
                                    "Status": data.elementAt(i).status,
                                    "title": data.elementAt(i).title
                                  };
                                });
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text(
                                          'Date'.tr(),
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: ListView.builder(
                                          itemCount: _products.length,
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemBuilder: (c, index) {
                                            return Card(
                                              child: ExpansionTile(
                                                title: Text(_products.elementAt(index)["id"],
                                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(15.0),
                                                    child: Column(children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Date'.tr(),
                                                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 10, right: 10),
                                                            child: Text(":"),
                                                          ),
                                                          Text(_products.elementAt(index)["id"]),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Type".tr(),
                                                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 10, right: 10),
                                                            child: Text(":"),
                                                          ),
                                                          Text(_products.elementAt(index)["name"]),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Description'.tr(),
                                                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 10, right: 10),
                                                            child: Text(":"),
                                                          ),
                                                          Text(_products.elementAt(index)["price"]),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Status'.tr(),
                                                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 10, right: 10),
                                                            child: Text(":"),
                                                          ),
                                                          Text(_products.elementAt(index)["Status"]),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Action'.tr(),
                                                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 10, right: 10),
                                                            child: Text(":"),
                                                          ),
                                                          ElevatedButton(
                                                            child: Text(_products.elementAt(index)['View'].toString(),
                                                                textAlign: TextAlign.center),
                                                            onPressed: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (c) => TicketView(
                                                                          _products.elementAt(index)["name"],
                                                                          _products.elementAt(index)["title"],
                                                                          _products.elementAt(index)["Status"])));
                                                            },
                                                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                                                          )
                                                        ],
                                                      ),
                                                    ]),
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
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
    );
  }
}
