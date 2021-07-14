import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/core/services/preference/preference.dart';
import 'package:grocery/splash_screen.dart';

import 'core/services/connectivity/connectivity_service.dart';
import 'core/services/localization/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConnectivityService().init();
  await EasyLocalization.ensureInitialized();

  await Preference.init();
  runApp(EasyLocalization(supportedLocales: [
    Locale('ar', ''),
    Locale('en', ''),
  ], path: 'assets/languages', child: ProviderScope(child: MyApp())));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),home:SplashScreen() ,

    );
  }
}
