import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier{
  Locale locale;

  LocaleProvider({@required this.locale});

  changeLanguage(Locale language){
    this.locale = language;
    notifyListeners();
  }
}