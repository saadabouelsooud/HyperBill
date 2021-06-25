/*
* File : Login
* Version : 1.0.0
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/core/services/theme/styles/text_styles.dart';
import 'package:grocery/core/utils/size_config.dart';

import '../../drawer_menu_screen.dart';
import 'ForgotPassword1Screen.dart';
import 'ForgotPassword2Screen.dart';

class Login1Screen extends StatefulWidget {
  @override
  _Login1ScreenState createState() => _Login1ScreenState();
}

class _Login1ScreenState extends State<Login1Screen> {
  bool _passwordVisible = false;
  var pass = TextEditingController();
  var email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 3 / 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: AppColors.hintColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MySize.size96))),
              ),
              Positioned(
                bottom: 20,
                right: 40,
                child: Text(
                  "LOGIN",
                  style: TextStyles.largeHintHeaderStyleBold,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: MySize.size16, right: MySize.size16, top: MySize.size16),
          child: Card(
            elevation: 8,
            child: Padding(
              padding:
                  EdgeInsets.only(top: MySize.size12, left: MySize.size16, right: MySize.size16, bottom: MySize.size12),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: email,
                    style: TextStyles.hintHeaderStyle,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyles.largeHintHeaderStyle,
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size16),
                    child: TextFormField(
                      controller: pass,
                      style: TextStyles.largeHintHeaderStyle,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyles.largeHintHeaderStyle,
                        prefixIcon: Icon(Icons.email_outlined),
                        suffixIcon: IconButton(
                          icon: Icon(_passwordVisible ? Icons.remove_red_eye : Icons.remove_red_eye_outlined),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: _passwordVisible,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) => ForgotPassword2Screen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyles.largeHintHeaderStyle,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(MySize.size24)),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.hintColor,
                          blurRadius: 3,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: FlatButton(
                        padding: EdgeInsets.only(
                            left: MySize.size64, right: MySize.size64, top: MySize.size10, bottom: MySize.size10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MySize.size24)),
                        color: AppColors.hintColor,
                        splashColor: Colors.white,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (c) => MainWidget()));
                        },
                        child: Text("LOGIN", style: TextStyles.hintHeaderStyle)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 24),
          child: Center(
            child: Text("OR", style: TextStyles.hintHeaderStyle),
          ),
        ),
      ],
    ));
  }
}
