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

  WebViewExample(this.url, this.model);

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
          var parse = Uri.parse(request.url);
          if (parse.queryParameters['paymentStatus'] == 'SUCCESS' ||
              parse.queryParameters['paymentStatus'] == 'Success' ||
              parse.queryParameters['paymentStatus'] == 'success') {
            context.read(rechargeControllerProvider).addSuccessRecharge(PaymentSuccessModel(
                    paymentStatus: parse.queryParameters['paymentStatus'],
                    cardDataToken: parse.queryParameters['cardDataToken'],
                    maskedCard: parse.queryParameters['maskedCard'],
                    merchantOrderId: parse.queryParameters['merchantOrderId'],
                    orderId: parse.queryParameters['orderId'],
                    cardBrand: parse.queryParameters['cardBrand'],
                    orderReference: parse.queryParameters['orderReference'],
                    transactionId: parse.queryParameters['transactionId'],
                    amount: parse.queryParameters['amount'],
                    currency: parse.queryParameters['currency'],
                    signature: parse.queryParameters['signature'],
                    mode: parse.queryParameters['mode'])
                .toJson());

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
