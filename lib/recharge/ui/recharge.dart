import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/core/services/theme/styles/text_styles.dart';
import 'package:grocery/core/utils/size_config.dart';
import 'package:grocery/dashboard/controller/dashboard_controller.dart';
import 'package:grocery/payments/controller/payment_controller.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'package:grocery/recharge/controller/recharge_controller.dart';
import 'package:grocery/recharge/model/recharge_model.dart';
import 'package:kf_drawer/kf_drawer.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              title: Text("Recharge",
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
            Consumer(
              builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
                var asyncValue = watch(dashboardMeterDataFutureProvider);
                return asyncValue.when(
                    data: (data) {
                      if(value!=null){
                        value="Unit No:" + data.elementAt(0).unitNo + " Serial: " + data.elementAt(0).serial.toString();
                      }
                      return Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.grey)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: data
                                      .map((e) => DropdownMenuItem(
                                            child: Text("Unit No:" + e.unitNo + " Serial: " + e.serial),
                                            value: "Unit No:" + e.unitNo + " Serial: " + e.serial,
                                          ))
                                      .toList(),
                                  onChanged: (c) {
                                    setState(() {
                                      value = c;
                                    });
                                  },value: value,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * .7,
                            child: TextFormField(
                              controller: amountTextEditingController,
                              keyboardType: TextInputType.number,
                              onEditingComplete: () {
                                if (amountTextEditingController.text.trim().isNotEmpty) {
                                  context
                                      .read(rechargeControllerProvider)
                                      .getPaymentData(MyParameter(id: id, amout: amountTextEditingController.text));
                                }
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                counterText: '',
                                labelStyle: TextStyle(color: AppColors.hintColor),
                                hintText: "Amount (EGP)",
                                hintStyle: TextStyle(color: AppColors.hintColor),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.hintColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.hintColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          Consumer(
                            builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
                              if (amountTextEditingController.text.trim().isNotEmpty) {

                                payTextEditingController.text =
                                    watch(payControllerProvider(MyParameter(amout: amountTextEditingController.text, id: id)))
                                        .data
                                        .value
                                        .amount
                                        .toString();
                              }

                              return Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width * .7,
                                child: TextFormField(
                                  enabled: false,
                                  controller: payTextEditingController,
                                  keyboardType: TextInputType.number,
                                  onEditingComplete: () {},
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    counterText: '',
                                    labelStyle: TextStyle(color: AppColors.hintColor),
                                    hintText: "You Will Pay",
                                    hintStyle: TextStyle(color: AppColors.hintColor),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.hintColor),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.hintColor),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(25)),
                              child: Text("Pay Now !", style: TextStyles.hintHeaderStyle),
                              padding: EdgeInsets.only(left: MySize.size64, right: MySize.size64, top: MySize.size15, bottom: MySize.size15),
                            ),
                          ),
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
            )
          ],
        ),
      ),
    );
  }
}
