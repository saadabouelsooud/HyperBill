/*
* File : Login
* Version : 1.0.0
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery/auth/controller/auth_controller.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/core/services/theme/styles/text_styles.dart';
import 'package:grocery/core/utils/size_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../drawer_menu_screen.dart';
import '../../widget.dart';
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
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.read(authControllerProvider);
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
                    color: AppColors.textColor,
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
                    style: TextStyles.largeHintHeaderStyle,
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
                          color: AppColors.textColor,
                          blurRadius: 3,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: FlatButton(
                        padding: EdgeInsets.only(
                            left: MySize.size64, right: MySize.size64, top: MySize.size10, bottom: MySize.size10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MySize.size24)),
                        color: AppColors.textColor,
                        splashColor: Colors.white,
                        onPressed: () {
                          if (provider.isLoginValidation(email.text, pass.text)) {
                            showLoaderDialog(context);

                            provider.login(email.text, pass.text).then((value) {
                              Navigator.pop(context);
                              if (value) {
                                Navigator.push(context, MaterialPageRoute(builder: (c) => MainWidget()));
                              } else {
                                Fluttertoast.showToast(
                                    msg: provider.message,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            });
                          } else {
                            Fluttertoast.showToast(
                                msg: provider.message,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
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
