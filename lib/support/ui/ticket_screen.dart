import 'package:flutter/material.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({Key key}) : super(key: key);

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  int _radioValue;
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Text("Ticket") ),body: ListView(children: [
      SizedBox(height: 20,)



    ],),);
  }
}
