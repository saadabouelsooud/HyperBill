/*
* File : Forgot Password
* Version : 1.0.0
* */


import 'package:flutter/material.dart';
import 'package:grocery/core/services/theme/styles/text_styles.dart';
import 'package:grocery/core/utils/size_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ForgotPassword1Screen extends StatefulWidget {
  @override
  _ForgotPassword1ScreenState createState() => _ForgotPassword1ScreenState();
}

class _ForgotPassword1ScreenState extends State<ForgotPassword1Screen> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
              color: themeData.backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 3 / 10,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: themeData.colorScheme.background,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(MySize.size48))),
                        ),
                        Positioned(
                          top: 30,
                          left: 10,
                          child: BackButton(
                            color: themeData.colorScheme.onBackground,
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: Text(
                            "FORGOT PASSWORD",
                            style:  TextStyles.largeHintHeaderStyleBold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(top: MySize.size16, bottom: MySize.size16),
                        color: themeData.backgroundColor,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                left: MySize.size16,
                                right: MySize.size16,
                              ),
                              child: Card(
                                elevation: 8,
                                child: Padding(
                                  padding: EdgeInsets.all(MySize.size16),
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        style: TextStyles.hintHeaderStyle,
                                        decoration: InputDecoration(
                                          hintText: "Email",
                                          hintStyle: TextStyles.largeHintHeaderStyle,
                                          prefixIcon:
                                          Icon(Icons.email_outlined),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: MySize.size16),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size24)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: themeData
                                                  .colorScheme.primary
                                                  .withAlpha(28),
                                              blurRadius: 3,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: FlatButton(
                                            padding: EdgeInsets.only(
                                                left: MySize.size64,
                                                right: MySize.size64,
                                                top: MySize.size10,
                                                bottom: MySize.size10),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(MySize.size24)),
                                            color:
                                            themeData.colorScheme.primary,
                                            highlightColor:
                                            Colors.white,
                                            splashColor:
                                            Colors.white.withAlpha(100),
                                            onPressed: () {},
                                            child: Text("RESET PASSWORD",
                                                style: TextStyles.largeHintHeaderStyleBold)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
