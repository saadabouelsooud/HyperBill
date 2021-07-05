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
  bool _passwordVisible = true;
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
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              left: MySize.size16, right: MySize.size16, top: MySize.size16),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(MySize.size24)),
            elevation: 1,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MySize.size80,
                  left: MySize.size16,
                  right: MySize.size16,
                  bottom: MySize.size80),
              child: Column(
                children: <Widget>[
                  Image.asset("assets/images/k.jpg"),
                  SizedBox(height: 30,),
                  TextFormField(
                    controller: email,
                    style: TextStyles.largeHintHeaderStyle,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyles.largeHintHeaderStyle,
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  SizedBox(height: 5,),

                  Container(
                    margin: EdgeInsets.only(top: MySize.size16),
                    child: TextFormField(
                      controller: pass,
                      style: TextStyles.largeHintHeaderStyle,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyles.largeHintHeaderStyle,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_passwordVisible
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined),
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
                  SizedBox(height: 20,),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => ForgotPassword2Screen()));
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
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size24)),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.textColor,
                          blurRadius: 3,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: (){


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
                      child: Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(25)),
                          child:
                              Text("LOGIN", style: TextStyles.hintHeaderStyle),
                      padding: EdgeInsets.only(
                          left: MySize.size64,
                          right: MySize.size64,
                          top: MySize.size10,
                          bottom: MySize.size10),
                    ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
