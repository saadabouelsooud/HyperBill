
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/auth/controller/auth_controller.dart';
import 'package:grocery/core/services/theme/styles/text_styles.dart';
import 'package:grocery/core/utils/size_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ForgotPassword2Screen extends StatefulWidget {
  @override
  _ForgotPassword2ScreenState createState() => _ForgotPassword2ScreenState();
}

class _ForgotPassword2ScreenState extends State<ForgotPassword2Screen> {
  ThemeData themeData;
  var email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return  CheckInternetConnection(
      child: Scaffold(appBar: AppBar(backgroundColor: Colors.white,elevation: 0,),
          body: Container(margin: EdgeInsets.all(20),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MySize.size16, bottom: MySize.size16),
                    child: Column(mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              bottom: MySize.size24, top: MySize.size8),
                          child: Text("FORGOT PASSWORD".tr(),
                              style: TextStyles.largeHintHeaderStyle),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: MySize.size16,
                              right: MySize.size16),
                          child: Column(
                            children: <Widget>[
                              TextFormField(controller: email,
                                style:TextStyles.largeHintHeaderStyle ,
                                decoration: InputDecoration(
                                  hintText: "Email".tr(),
                                  hintStyle:TextStyles. largeHintHeaderStyle,
                                  prefixIcon:
                                  Icon(MdiIcons.emailOutline),
                                ),
                              ),
                              Container(
                                margin:
                                EdgeInsets.only(top: MySize.size16),
                                width:
                                MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size24)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: themeData
                                          .colorScheme.primary
                                          .withAlpha(18),
                                      blurRadius: 3,
                                      offset: Offset(0, 1),
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
                                        BorderRadius.circular(
                                            MySize.size24)),
                                    color:
                                    Colors.green,
                                    highlightColor:
                                    themeData.colorScheme.primary,
                                    splashColor:
                                    Colors.white.withAlpha(100),
                                    onPressed: () {
                                      showLoaderDialog(context);
                                      context.read(authControllerProvider).forgetPassword(email.text).then((value) {

                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: Text("RESET PASSWORD".tr(),
                                        style:TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: "Schyler",
                                        ))),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ))
    );
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  final BuildContext _context;

  _MyCustomClipper(this._context);

  @override
  Path getClip(Size size) {
    final path = Path();
    Size size = MediaQuery.of(_context).size;
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(0, size.height * 0.6);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
