import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery/core/services/theme/styles/colors.dart';
import 'package:grocery/core/services/theme/styles/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:grocery/support/controller/support_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/widget.dart';
import 'package:easy_localization/easy_localization.dart';

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
        case 1:
          context.read(supportControllerProvider).type = "Help";
          break;
        case 2:
          context.read(supportControllerProvider).type = "Issue";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.textColor, //change your color here
          ),
          title: Text(
            "Ticket".tr(),
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
                  Text("Type".tr()),
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
                      Text("Help".tr())
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: Radio(value: 2, groupValue: _radioValue, onChanged: _handleRadioValueChange),
                        height: 20,
                        width: 40,
                      ),
                      Text("Issue".tr())
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Text("Title".tr()),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .8,
                child: TextFormField(
                  controller: context.read(supportControllerProvider).titleTextController,
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
                      borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.hintColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text("Description".tr()),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .8,
                child: TextFormField(
                  controller: context.read(supportControllerProvider).descriptionTextController,
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
                      borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.hintColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
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
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();

                      showLoaderDialog(context);

                      context
                          .read(supportControllerProvider)
                          .addTicket(
                              context.read(supportControllerProvider).type,
                              context.read(supportControllerProvider).descriptionTextController.text,
                              context.read(supportControllerProvider).titleTextController.text)
                          .then((value) {
                        Navigator.of(context).pop();
                        Fluttertoast.showToast(
                            msg: context.read(supportControllerProvider).message,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(25)),
                      child: Text("Save".tr(), style: TextStyles.hintHeaderStyle),
                      padding: EdgeInsets.only(left: 64, right: 64, top: 15, bottom: 15),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    context.read(supportControllerProvider).descriptionTextController.clear();
    context.read(supportControllerProvider).titleTextController.clear();
    super.dispose();
  }
}
