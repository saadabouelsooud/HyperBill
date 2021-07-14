import 'package:flutter/material.dart';
import 'package:grocery/core/services/theme/styles/styles.dart';
import 'package:easy_localization/easy_localization.dart';

class TicketView extends StatelessWidget {
  final String title, description, type;

  TicketView(this.type, this.description, this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameTextEditingController = TextEditingController(text: type);
    var customerTypeTextEditingController = TextEditingController(text: title);
    var codeTextEditingController = TextEditingController(text: description);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Ticket View".tr()),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: 60,),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * .7,
              child: TextFormField(
                enabled: false,
                controller: nameTextEditingController,
                keyboardType: TextInputType.number,
                onEditingComplete: () {},
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  counterText: '',
                  labelStyle: TextStyle(color: AppColors.hintColor),
                  labelText: "Type".tr(),
                  hintStyle: TextStyle(color: AppColors.hintColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hintColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hintColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * .7,
              child: TextFormField(
                enabled: false,
                controller: customerTypeTextEditingController,
                keyboardType: TextInputType.number,
                onEditingComplete: () {},
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  counterText: '',
                  labelStyle: TextStyle(color: AppColors.hintColor),
                  labelText: "Title".tr(),
                  hintStyle: TextStyle(color: AppColors.hintColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hintColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hintColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * .7,
              child: TextFormField(
                enabled: false,
                controller: codeTextEditingController,
                keyboardType: TextInputType.number,
                onEditingComplete: () {},
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  counterText: '',
                  labelStyle: TextStyle(color: AppColors.hintColor),
                  labelText: "Description".tr(),
                  hintStyle: TextStyle(color: AppColors.hintColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hintColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hintColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hintColor.withOpacity(.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
