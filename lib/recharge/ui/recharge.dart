import 'package:flutter/material.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/core/services/theme/styles/text_styles.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'package:kf_drawer/kf_drawer.dart';

class RechargeScreen extends KFDrawerContent {
  @override
  _RechargeScreenState createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  var meterTextEditingController = TextEditingController();
  var amountTextEditingController = TextEditingController();
  var payTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [

            AppBar(
              title: Text("Recharge"),actions: [
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
                  hintText: "Meter",
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
                  hintText: "Amount (EGP)",
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
                  hintText: "You Will Pay",
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
            Container(
              width: 120,
              height: 50,
              child: ElevatedButton(
                onPressed: (){},
                child: Text(
                  "Pay Now !",
                  style: TextStyles.hintHeaderStyle,
                ),
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.blue)))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
