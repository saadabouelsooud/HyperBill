import 'package:flutter/material.dart';
import 'package:grocery/core/services/theme/styles/styles.dart';

class SliderWidget extends StatefulWidget {
  final int number;

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
                children: [IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios))],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.timer,size: 30,color: Colors.green,),
                  SizedBox(height: 10,),
                  Text("Meter"),
                  Text("Unit No : ${widget.number}",style: TextStyles.massiveHeaderStyleNormal,),
                  Text("Meter serial :5015485 "),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
