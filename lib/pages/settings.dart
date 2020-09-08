import 'package:flutter/material.dart';
import 'package:mechange_app/provider/Language.dart';
import 'package:mechange_app/provider/theme.dart';
import 'package:provider/provider.dart';

import '../models/language.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Language _selectL = Language.EN;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget languageButton(bool active, Function action, String text) {
    return SizedBox(
      width: 45,
      child: FlatButton(
        padding: EdgeInsets.only(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontFamily: "Kanit"),
            ),
            Container(
              width: 25,
              height: 2.5,
              color: active
                  ? Color.fromRGBO(143, 204, 147, 1)
                  : Colors.transparent,
            )
          ],
        ),
        onPressed: action,
      ),
    );
  }

  Widget selectLanguageBar(LocaleProvider language) {
    return SizedBox(
      width: 150,
      height: 37.5,
      child: Row(
        children: [
          languageButton(language.locale == Locale("en",'EN'), () {
            language.changeLanguage(Locale("EN",'en'));
          }, "EN"),
          languageButton(language.locale == Locale("th","TH"), () {
            language.changeLanguage(Locale("TH","th"));
          }, "ไทย"),
          languageButton(language.locale == Locale("cn","CN"), () {
            language.changeLanguage(Locale("CN","cn"));
          }, "中文")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    final language = Provider.of<LocaleProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 27.5, top: 32, right: 10),
        child: Column(
          children: [
            FlatButton(
              padding: EdgeInsets.only(),
              child: ListTile(
                  contentPadding: EdgeInsets.only(left: 10),
                  leading: Text("About",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600))),
              onPressed: () {},
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 10),
              leading: Text("Language",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              trailing: selectLanguageBar(language),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 10),
              leading: Text("Dark Mode",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              trailing: Switch(activeColor: theme.themePrimary,value: theme.brightness == Brightness.dark, onChanged: (value){
                theme.brightness == Brightness.dark? theme.switchToDarkMode(false):theme.switchToDarkMode(true);
              }),
            ),
            FlatButton(
              padding: EdgeInsets.only(),
              child: ListTile(
                  contentPadding: EdgeInsets.only(left: 10),
                  leading: Text("Contact Us",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600))),
              onPressed: () {},
            ),
            FlatButton(
              padding: EdgeInsets.only(),
              child: ListTile(
                  contentPadding: EdgeInsets.only(left: 10),
                  leading: Text("Rate App",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600))),
              onPressed: () {},
            ),
            FlatButton(
              padding: EdgeInsets.only(),
              child: ListTile(
                  contentPadding: EdgeInsets.only(left: 10),
                  leading: Text("Share App",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600))),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
