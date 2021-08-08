import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/core/services/theme/styles/text_styles.dart';
import 'package:grocery/core/utils/size_config.dart';
import 'package:grocery/dashboard/controller/dashboard_controller.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'package:grocery/recharge/controller/recharge_controller.dart';
import 'package:grocery/recharge/model/recharge_model.dart';
import 'package:grocery/recharge/ui/web_view.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../drawer_lib.dart';

class RechargeScreen extends KFDrawerContent {
  @override
  _RechargeScreenState createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  var meterTextEditingController = TextEditingController();
  var amountTextEditingController = TextEditingController();
  var payTextEditingController = TextEditingController();
  var id;
  var value;
  RechargeModel rechargeModel;

  _itemChoice(choice) {
    if (choice == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (c) => ProfileScreen()));
    }
    if (choice == 2) {
      if (EasyLocalization.of(context).locale == Locale('ar', "")) {
        EasyLocalization.of(context).setLocale(Locale('en', ""));
      } else {
        EasyLocalization.of(context).setLocale(Locale('ar', ""));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Recharge".tr(),
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
      body: Center(
        child: ListView(
          children: [
            Consumer(
              builder: (BuildContext context,
                  T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
                var asyncValue = watch(dashboardMeterDataFutureProvider);
                return asyncValue.when(
                    data: (data) {
                      if (value != null) {
                        value = "Unit No:" +
                            data.elementAt(0).unitNo +
                            " Serial: " +
                            data.elementAt(0).serial.toString();
                      }
                      return Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: data
                                      .map((e) => DropdownMenuItem(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text("Unit No:" +
                                                  e.unitNo +
                                                  " Serial: " +
                                                  e.serial),
                                            ),
                                            value: "Unit No:" +
                                                e.unitNo +
                                                " Serial: " +
                                                e.serial,
                                          ))
                                      .toList(),
                                  onChanged: (c) {
                                    setState(() {
                                      value = c;
                                      data.forEach((element) {
                                        c.toString().contains(element.unitNo);
                                        id = element.unitNo;
                                      });
                                    });
                                  },
                                  value: value,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * .7,
                            child: TextFormField(
                              controller: amountTextEditingController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                counterText: '',
                                labelStyle:
                                    TextStyle(color: AppColors.hintColor),
                                hintText: "Amount (EGP)".tr(),
                                hintStyle:
                                    TextStyle(color: AppColors.hintColor),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.hintColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          AppColors.hintColor.withOpacity(.2)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.hintColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          AppColors.hintColor.withOpacity(.2)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          Consumer(
                            builder: (BuildContext context,
                                T Function<T>(ProviderBase<Object, T>) watch,
                                Widget child) {
                              payTextEditingController.text =
                                  watch(amountProvider).state;

                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();

                                      if (amountTextEditingController.text
                                              .trim()
                                              .isNotEmpty &&
                                          id != null) {
                                        context
                                            .read(rechargeControllerProvider)
                                            .getPaymentData(MyParameter(
                                                id: id,
                                                amout:
                                                    amountTextEditingController
                                                        .text))
                                            .then((value) {
                                          if (value != null) {
                                            rechargeModel = value;
                                            context.read(amountProvider).state =
                                                value.formattedAmt.toString();
                                          } else {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "some thing error please try again "
                                                        .tr(),
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          }
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      child: TextFormField(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                        },
                                        enabled: false,
                                        controller: payTextEditingController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          counterText: '',
                                          labelStyle: TextStyle(
                                              color: AppColors.hintColor),
                                          hintText: "You Will Pay".tr(),
                                          hintStyle: TextStyle(
                                              color: AppColors.hintColor),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColors.hintColor),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColors.hintColor
                                                    .withOpacity(.2)),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColors.hintColor),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColors.hintColor
                                                    .withOpacity(.2)),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();

                                      if (amountTextEditingController.text
                                              .trim()
                                              .isNotEmpty &&
                                          id != null) {
                                        context
                                            .read(rechargeControllerProvider)
                                            .getPaymentData(MyParameter(
                                                id: id,
                                                amout:
                                                    amountTextEditingController
                                                        .text))
                                            .then((value) {
                                          if (value != null) {
                                            rechargeModel = value;
                                            context.read(amountProvider).state =
                                                value.formattedAmt.toString();
                                            if (rechargeModel != null) {
                                              String url =
                                                  "https://test-iframe.kashier.io/payment?" +
                                                      "mid=${rechargeModel.mid}&orderId=${rechargeModel.orderId}&amount=${rechargeModel.formattedAmt}&currency=${rechargeModel.currency}&hash=${rechargeModel.hash}&merchantRedirect=${rechargeModel.redirectUrl}";
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (c) =>
                                                          WebViewExample(url,
                                                              rechargeModel))).then((value) {

                                                if (context.read(rechargeControllerProvider).message.isNotEmpty) {
                                                  showDialog(
                                                      context: context,
                                                      builder: (c) => Dialog(
                                                        child: Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: Center(
                                                            child:
                                                            Text(context.read(rechargeControllerProvider).message.tr(),style: TextStyles.hintTextStyles,),
                                                          ),
                                                        ),
                                                      ));
                                                  context.read(rechargeControllerProvider).message="";
                                                }

                                              });
                                            }
                                          } else {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "some thing error please try again "
                                                        .tr(),
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          }
                                        });
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Text("Pay Now !".tr(),
                                          style: TextStyles.hintHeaderStyle),
                                      padding: EdgeInsets.only(
                                          left: MySize.size64,
                                          right: MySize.size64,
                                          top: MySize.size15,
                                          bottom: MySize.size15),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    },
                    loading: () => Expanded(
                          child: Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
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
      ),
    );
  }

  @override
  void dispose() {
    context.read(amountProvider).state = "0.0";

    payTextEditingController.dispose();
    amountTextEditingController.dispose();
    meterTextEditingController.dispose();
    id = null;
    value = null;
    rechargeModel = null;
    super.dispose();
  }
}
