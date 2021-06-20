import 'package:flutter/material.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/core/services/theme/styles/text_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var meterTextEditingController = TextEditingController();
  var amountTextEditingController = TextEditingController();
  var payTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
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
                  controller: meterTextEditingController,
                  keyboardType: TextInputType.number,
                  onEditingComplete: () {},
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    counterText: '',
                    labelStyle: TextStyle(color: AppColors.hintColor),
                   labelText:"Name" ,
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
                  controller: amountTextEditingController,
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
                  controller: payTextEditingController,
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
              ),  Container(
                height: 60,
                width: MediaQuery.of(context).size.width * .7,
                child: TextFormField(
                  controller: meterTextEditingController,
                  keyboardType: TextInputType.number,
                  onEditingComplete: () {},
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    counterText: '',
                    labelStyle: TextStyle(color: AppColors.hintColor),
                   labelText:"Tenant Name" ,
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
                  controller: amountTextEditingController,
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
                  controller: payTextEditingController,
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
              ),  Container(
                height: 60,
                width: MediaQuery.of(context).size.width * .7,
                child: TextFormField(
                  controller: meterTextEditingController,
                  keyboardType: TextInputType.number,
                  onEditingComplete: () {},
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    counterText: '',
                    labelStyle: TextStyle(color: AppColors.hintColor),
                   labelText:"Email" ,
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
                  controller: amountTextEditingController,
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
                  controller: payTextEditingController,
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
              ),  Container(
                height: 60,
                width: MediaQuery.of(context).size.width * .7,
                child: TextFormField(
                  controller: meterTextEditingController,
                  keyboardType: TextInputType.number,
                  onEditingComplete: () {},
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    counterText: '',
                    labelStyle: TextStyle(color: AppColors.hintColor),
                   labelText:"Commercial Record" ,
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
                  controller: amountTextEditingController,
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
      ),
    );
  }
}
