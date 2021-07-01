import 'package:flutter/material.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/core/services/theme/styles/text_styles.dart';
import 'package:grocery/core/utils/size_config.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({Key key}) : super(key: key);

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  int _radioValue;
  final issueTextController = TextEditingController();

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
    return Scaffold(
      appBar: AppBar(  iconTheme: IconThemeData(
        color: AppColors.textColor, //change your color here
      ),
        title: Text(
          "Ticket",
          style: TextStyle(color: AppColors.textColor),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Type"),
                SizedBox(
                  width: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      child: Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      height: 20,
                      width: 40,
                    ),
                    Text("Help")
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      child: Radio(
                          value: 2,
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange),
                      height: 20,
                      width: 40,
                    ),
                    Text("Issue")
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Title"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .8,
              child: TextFormField(
                controller: issueTextController,
                maxLength: 250,
                maxLines: 3,
                minLines: 3,
                onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  labelStyle: TextStyle(color: AppColors.hintColor),
                  hintStyle: TextStyle(color: AppColors.hintColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hintColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hintColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text("Description"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .8,
              child: TextFormField(
                controller: issueTextController,
                maxLength: 500,
                maxLines: 6,
                minLines: 6,
                onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  labelStyle: TextStyle(color: AppColors.hintColor),
                  hintStyle: TextStyle(color: AppColors.hintColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hintColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hintColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                // Container(
                //   padding: EdgeInsets.all(15),
                //   child: Text("Back"),
                //   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                // ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25)),
                    child: Text("Save", style: TextStyles.hintHeaderStyle),
                    padding: EdgeInsets.only(
                        left: MySize.size64,
                        right: MySize.size64,
                        top: MySize.size15,
                        bottom: MySize.size15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
