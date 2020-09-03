import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 45,top: 32,right: 30),
        child: Column(
          children: [
            FlatButton(
              padding: EdgeInsets.only(),
              child: ListTile(contentPadding: EdgeInsets.only(),leading : Text("About", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600))),
              onPressed: () {},
            ),
            ListTile(contentPadding: EdgeInsets.only(),leading : Text("Language", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)))
          ],
        ),
      ),
    );
  }
}
