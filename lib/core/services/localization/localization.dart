import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod/riverpod.dart';

import '../preference/preference.dart';

class AppLanguageModel extends StateNotifier<Locale> {
  Locale state = Locale('en');

  AppLanguageModel() : super(Locale('en'));
  Locale get appLocal => state ?? Locale("en");

  fetchLocale() async {
    if (Preference.getString(PrefKeys.languageCode) == null) {
      state = Locale('en');
    } else {
      state = Locale(Preference.getString(PrefKeys.languageCode));
    }

    return null;
  }

  void changeLanguage(Locale type) async {
    if (state == type) {
      return;
    }

    if (type == Locale("ar")) {
      state = Locale("ar");
      await Preference.setString(PrefKeys.languageCode, 'ar');
      await Preference.setString('countryCode', '');
    } else if (type == Locale("en")) {
      state = Locale("en");
      await Preference.setString(PrefKeys.languageCode, 'en');
    }
  }
}

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  // Helper method to keep the code in the chat.ui.widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings;

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    String jsonString = await rootBundle.loadString('assets/languages/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String get(String key) {
    return _localizedStrings[key];
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
