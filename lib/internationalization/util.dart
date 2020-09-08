import 'package:flutter/material.dart';
import 'package:mechange_app/models/language.dart';

Locale getLocalefromLanguage(Language language){
  String langStr = language.toString().split(".")[1];
  print(langStr);
  return Locale(langStr.toLowerCase(),langStr.toUpperCase());
}