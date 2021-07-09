import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/core/services/theme/styles/text_styles.dart';
import 'package:grocery/profile/controller/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var nameTextEditingController = TextEditingController();
  var customerTypeTextEditingController = TextEditingController();
  var codeTextEditingController = TextEditingController();
  var tenantNameTextEditingController = TextEditingController();
  var subscriberNameTextEditingController = TextEditingController();
  var commercialNameTextEditingController = TextEditingController();
  var emailTextEditingController = TextEditingController();
  var phoneTextEditingController = TextEditingController();
  var mobileTextEditingController = TextEditingController();
  var commercialRecordTextEditingController = TextEditingController();
  var taxRecordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.textColor, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: TextStyle(color: AppColors.textColor),
        ),
      ),
      body: Consumer(
        builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
          var asyncValue = watch(profileFutureProvider);
          return asyncValue.when(
              data: (data) {
                 nameTextEditingController.text =data.nameAr!=null? data.nameAr.toString():"";
                 customerTypeTextEditingController.text = data.ctype!=null?data.ctype.toString():"";
                 codeTextEditingController.text = data.code!=null?data.code.toString():"";
                 tenantNameTextEditingController.text = data.tenantName!=null?data.tenantName.toString():"";
                 subscriberNameTextEditingController.text =data.subscriberName!=null? data.subscriberName.toString():"";
                 commercialNameTextEditingController.text = data.commercialName!=null?data.commercialName.toString():"";
                 emailTextEditingController.text =data.email!=null? data.email.toString():"";
                 phoneTextEditingController .text= data.phone!=null?data.phone.toString():"";
                 mobileTextEditingController .text=data.mobile!=null? data.mobile.toString():"";
                 commercialRecordTextEditingController.text = data.commercialRecord!=null?data.commercialRecord.toString():"";
                 taxRecordTextEditingController.text =data.taxRecord!=null? data.taxRecord.toString():"";
                return Container(
                  margin: EdgeInsets.all(25),
                  child: Center(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * .7,
                          child: TextFormField(
                            enabled: false,
                            controller: nameTextEditingController,
                            keyboardType: TextInputType.number,
                            onEditingComplete: () {},
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              counterText: '',
                              labelStyle: TextStyle(color: AppColors.hintColor),
                              labelText: "Name",
                              hintStyle: TextStyle(color: AppColors.hintColor),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * .7,
                          child: TextFormField(
                            enabled: false,
                            controller: customerTypeTextEditingController,
                            keyboardType: TextInputType.number,
                            onEditingComplete: () {},
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              counterText: '',
                              labelStyle: TextStyle(color: AppColors.hintColor),
                              labelText: "Customer Type",
                              hintStyle: TextStyle(color: AppColors.hintColor),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * .7,
                          child: TextFormField(
                            enabled: false,
                            controller: codeTextEditingController,
                            keyboardType: TextInputType.number,
                            onEditingComplete: () {},
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              counterText: '',
                              labelStyle: TextStyle(color: AppColors.hintColor),
                              labelText: "Code",
                              hintStyle: TextStyle(color: AppColors.hintColor),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * .7,
                          child: TextFormField(
                            enabled: false,
                            controller: tenantNameTextEditingController,
                            keyboardType: TextInputType.number,
                            onEditingComplete: () {},
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              counterText: '',
                              labelStyle: TextStyle(color: AppColors.hintColor),
                              labelText: "Tenant Name",
                              hintStyle: TextStyle(color: AppColors.hintColor),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * .7,
                          child: TextFormField(
                            enabled: false,
                            controller: subscriberNameTextEditingController,
                            keyboardType: TextInputType.number,
                            onEditingComplete: () {},
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              counterText: '',
                              labelStyle: TextStyle(color: AppColors.hintColor),
                              labelText: "Subscriber Name",
                              hintStyle: TextStyle(color: AppColors.hintColor),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * .7,
                          child: TextFormField(
                            enabled: false,
                            controller: commercialNameTextEditingController,
                            keyboardType: TextInputType.number,
                            onEditingComplete: () {},
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              counterText: '',
                              labelStyle: TextStyle(color: AppColors.hintColor),
                              labelText: "Commercial Name",
                              hintStyle: TextStyle(color: AppColors.hintColor),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * .7,
                          child: TextFormField(
                            enabled: false,
                            controller: emailTextEditingController,
                            keyboardType: TextInputType.number,
                            onEditingComplete: () {},
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              counterText: '',
                              labelStyle: TextStyle(color: AppColors.hintColor),
                              labelText: "Email",
                              hintStyle: TextStyle(color: AppColors.hintColor),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * .7,
                          child: TextFormField(
                            enabled: false,
                            controller: phoneTextEditingController,
                            keyboardType: TextInputType.number,
                            onEditingComplete: () {},
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              counterText: '',
                              labelStyle: TextStyle(color: AppColors.hintColor),
                              labelText: "Phone",
                              hintStyle: TextStyle(color: AppColors.hintColor),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * .7,
                          child: TextFormField(
                            enabled: false,
                            controller: mobileTextEditingController,
                            keyboardType: TextInputType.number,
                            onEditingComplete: () {},
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              counterText: '',
                              labelStyle: TextStyle(color: AppColors.hintColor),
                              labelText: "Mobile",
                              hintStyle: TextStyle(color: AppColors.hintColor),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * .7,
                          child: TextFormField(
                            enabled: false,
                            controller: commercialRecordTextEditingController,
                            keyboardType: TextInputType.number,
                            onEditingComplete: () {},
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              counterText: '',
                              labelStyle: TextStyle(color: AppColors.hintColor),
                              labelText: "Commercial Record",
                              hintStyle: TextStyle(color: AppColors.hintColor),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * .7,
                          child: TextFormField(
                            enabled: false,
                            controller: taxRecordTextEditingController,
                            keyboardType: TextInputType.number,
                            onEditingComplete: () {},
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              counterText: '',
                              labelStyle: TextStyle(color: AppColors.hintColor),
                              labelText: "Tax Record",
                              hintStyle: TextStyle(color: AppColors.hintColor),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                );
              },
              loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
              error: (e, ee) {
                print(ee.toString());
                print(e.toString());
                return Center(child: Text(ee.toString()));

              } );
        },
      ),
    );
  }
}
