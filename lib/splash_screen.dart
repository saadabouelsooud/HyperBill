
import 'package:flutter/material.dart';
import 'package:grocery/auth/ui/Login1Screen.dart';
import 'package:grocery/core/utils/size_config.dart';

import 'auth/controller/auth_controller.dart';
import 'drawer_menu_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4),(){
      var provider = context.read(authControllerProvider);

      if(provider.isUserLogged!=null &&provider.isUserLogged){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c) => MainWidget()), (route) => false);
      }
      else{

        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c) => Login1Screen()), (route) => false);

    }});
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(child: Image.asset("assets/images/logo.png"),),
      ),
    );
  }


}
