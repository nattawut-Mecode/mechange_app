import 'package:flutter/material.dart';
import 'package:mechange_app/models/language.dart';

class LanguageProvider with ChangeNotifier{
  Language language;

  LanguageProvider({@required this.language});

  changeLanguage(Language language){
    this.language = language;
    notifyListeners();
  }
}