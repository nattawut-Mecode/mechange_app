import 'package:flutter/material.dart';

class BottomNavigationIndexProvider with ChangeNotifier{
  int selectedIndex = 0;

  changeSelectedIndex(int index){
    selectedIndex = index;
    notifyListeners();
  }
  
}