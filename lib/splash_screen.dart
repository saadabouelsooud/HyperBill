
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
  AnimationController animation;
  Animation<double> _fadeInFadeOut;
  bool showAnimate = false;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);


    animation.forward();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        showAnimate = true;
      });
    });


    Future.delayed(Duration(seconds: 4),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c) => Login1Screen()), (route) => false);

    });
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(child: Text("Hyper Bill"),),
      ),
    );
  }

  @override
  void deactivate() {
    animation.dispose();    // TODO: implement dispose

    // TODO: implement deactivate
    super.deactivate();
  }
}
