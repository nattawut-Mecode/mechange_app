import 'package:flutter/material.dart';

class BuyProvider with ChangeNotifier{
  bool isBuy = true;
  
  changeBuyMode(bool status){
    isBuy = status;
    notifyListeners();

  }
}