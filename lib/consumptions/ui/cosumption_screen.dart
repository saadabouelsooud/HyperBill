import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:grocery/consumptions/ui/chart.dart';
import 'package:kf_drawer/kf_drawer.dart';

class ConsumptionsScreen extends KFDrawerContent {
  @override
  _ConsumptionsState createState() => _ConsumptionsState();
}

class _ConsumptionsState extends State<ConsumptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: ,
          title: Text("Consumptions"),
          actions: [
            InkWell(
              onTap: () {


              },
              child: Padding(padding: EdgeInsets.all(15), child: Icon(Icons.person_pin)),
            )
          ],
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            child: Material(
              shadowColor: Colors.transparent,
              color: Colors.transparent,
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: widget.onMenuPressed,
              ),
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: LineChartSample2(),
              ),
            ],
          ),
        ));
  }
}
