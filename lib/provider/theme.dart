import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  Color themePrimary;

  changePrimaryColor(Color colorPrimary){
    themePrimary = colorPrimary;
    notifyListeners();
  }

  ThemeProvider({@required this.themePrimary});
}