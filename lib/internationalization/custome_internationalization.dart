import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomeLocalizaation{
  final Locale locale;

  CustomeLocalizaation(this.locale);

  static CustomeLocalizaation of(BuildContext context) {
    return Localizations.of<CustomeLocalizaation>(context, CustomeLocalizaation);
  }

  Map<String,String> _localizedValues;

  Future load() async{
    String jsonStringValues = await rootBundle.loadString('lib/lang/${locale.languageCode}.json');

    Map<String,dynamic> mappedJson = json.decode(jsonStringValues);

    _localizedValues = mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslateValue(String key){
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<CustomeLocalizaation> delegate = CustomeLocalizaationDelegate();

}

class CustomeLocalizaationDelegate extends LocalizationsDelegate<CustomeLocalizaation> {
  const CustomeLocalizaationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'th', 'zh'].contains(locale.languageCode);

  @override
  Future<CustomeLocalizaation> load(Locale locale) async {
    CustomeLocalizaation localization = new CustomeLocalizaation(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(CustomeLocalizaationDelegate old) => false;
}