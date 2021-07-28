import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/recharge/controller/recharge_controller.dart';
import 'package:grocery/recharge/model/recharge_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebViewExample extends StatefulWidget {
  final url;
  final RechargeModel model;

  WebViewExample(this.url,this.model);

  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (request) {
          if (request.url.contains('app/pay/status')) {
            context.read(rechargeControllerProvider).addSuccessRecharge(PaymentSuccessModel(
                amount:widget.model.formattedAmt,
                cardBrand:"",
                cardDataToken:"",
                currency:widget.model.currency,
                maskedCard:"",
                merchantOrderId:"",
                mode:"",
                orderId:widget.model.orderId,
                orderReference:"",
                paymentStatus:"",
                signature:"",
                transactionId:"").toJson());
            Navigator.pop(context);
            return NavigationDecision.prevent;
          } else {
            return NavigationDecision.navigate;
          }
        },

      ),
    );
  }
}
