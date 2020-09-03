import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  Color themePrimary;
  Brightness brightness;

  changePrimaryColor(Color colorPrimary){
    themePrimary = colorPrimary;
    notifyListeners();
  }

  switchToDarkMode(bool switchDark){
    switchDark? brightness = Brightness.dark:brightness = Brightness.light;
    notifyListeners();
  }

  ThemeProvider({@required this.themePrimary});
}