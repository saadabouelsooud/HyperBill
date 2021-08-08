import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery/core/services/theme/styles/styles.dart';
import 'package:grocery/dashboard/model/meter_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:grocery/profile/ui/profile_screen.dart';
import 'core/services/connectivity/connectivity_service.dart';
import 'dashboard/controller/dashboard_controller.dart';

class SliderWidget extends StatefulWidget {
  final List<MeterModel> number;

  SliderWidget(this.number, {Key key}) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: Container(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        if (context.read(counterProvider).state > 1) context.read(counterProvider).state--;
                      },
                      icon: Icon(Icons.arrow_back_ios))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: SvgPicture.asset("assets/images/Meter.svg",color: Colors.green,),
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Meter".tr(),
                    style: TextStyles.headerStyle,
                  ),
                  Text(
                    "Unit No :".tr()+ "${widget.number.elementAt(context.read(counterProvider).state-1).unitNo}",
                    style: TextStyles.massiveHeaderStyleNormal,
                  ),
                  Text("Meter serial :".tr()+" : "+"${widget.number.elementAt(context.read(counterProvider).state-1).serial}", style: TextStyles.headerStyle),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        if (widget.number.length > (context.read(counterProvider).state )){ context.read(counterProvider).state++;}
                      },
                      icon: Icon(Icons.arrow_forward_ios))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        SizedBox(width: 10,),
        Container(margin: EdgeInsets.only(left: 7), child: Text("Loading...".tr())),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return CheckInternetConnectionDialog(child: alert);
    },
  );
}
class CheckInternetConnection extends StatelessWidget {
  final Widget child;

  CheckInternetConnection({this.child});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: ConnectivityService().connectionChange,
        builder: (c, s) {
          if (s.hasData) {
            if (s.data) {
              return child;
            } else {
              return Scaffold(
                body: Container(
                  width: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "لا يوجد انترنت حالبا ",
                        style: TextStyles.headerStyleNormal,
                      ),
                    ],
                  ),
                ),
              );
            }
          } else {
            return child;
          }
        });
  }
}
class CheckInternetConnectionDialog extends StatelessWidget {
  final Widget child;


  CheckInternetConnectionDialog({this.child,});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: ConnectivityService().connectionChange,
        builder: (c, s) {
          if (s.hasData) {
            if (s.data) {

              return child;
            } else {
              Navigator.of(context).pop();
              return child;
            }
          } else {
            return child;
          }
        });
  }
}
void showFlutterToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

