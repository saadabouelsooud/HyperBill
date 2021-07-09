import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery/core/services/theme/styles/styles.dart';
import 'package:grocery/dashboard/model/meter_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                        if (context.read(counterProvider).state > 0) context.read(counterProvider).state--;
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
                    "Meter",
                    style: TextStyles.headerStyle,
                  ),
                  Text(
                    "Unit No : ${widget.number.elementAt(context.read(counterProvider).state-1).unitNo}",
                    style: TextStyles.massiveHeaderStyleNormal,
                  ),
                  Text("Meter serial :${widget.number.elementAt(context.read(counterProvider).state-1).serial}", style: TextStyles.headerStyle),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        if (widget.number.length > (context.read(counterProvider).state + 1)) context.read(counterProvider).state++;
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
        Container(margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
