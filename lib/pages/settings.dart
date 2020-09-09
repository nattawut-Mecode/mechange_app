import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mechange_app/themes/themes.dart';

import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/infomation.dart';
import '../internationalization/custome_internationalization.dart';
import '../provider/language.dart';
import '../provider/theme.dart';
import '../models/language.dart';
import '../utils/disable_glow.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  bool isDarkMode = false;

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

  Widget selectLanguageBar(LanguageProvider language) {
    return SizedBox(
      width: 150,
      height: 37.5,
      child: Row(
        children: [
          languageButton(language.language == Language.EN, () {
            language.changeLanguage(Language.EN);
          }, "EN"),
          languageButton(language.language == Language.TH, () {
            language.changeLanguage(Language.TH);
          }, "ไทย"),
          languageButton(language.language == Language.ZH, () {
            language.changeLanguage(Language.ZH);
          }, "中文")
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  shareApplicationSocial() {
    Share.share(
        "https://apps.apple.com/th/app/mechange-thai-baht/id1221797659");
  }

  contractUsEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: Infomation.contractEmail,
      query: 'subject=Contract US&body=',
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  aboutApplication() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            titlePadding: EdgeInsets.only(left: 25, top: 10),
            title: ListTile(
              contentPadding: EdgeInsets.only(),
              leading: SvgPicture.asset(Infomation.assetsLogoColor,width: 35,height: 35,),
              title: Text(
                "MeChange",
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text("v1.0"),
            ),
            actions: [
              FlatButton(
                textColor: ThemeApp.primaryColor,
                child: Text("View Licenses"),
                onPressed: () {},
              ),
              FlatButton(
                textColor: ThemeApp.primaryColor,
                child: Text("Close"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    final language = Provider.of<LanguageProvider>(context);
    return Padding(
      padding: EdgeInsets.only(
        top: 32,
      ),
      child: ScrollConfiguration(
        behavior: DisableGlow(),
        child: ListView(
          children: [
            FlatButton(
              padding: EdgeInsets.only(),
              child: ListTile(
                  contentPadding: EdgeInsets.only(left: 35),
                  leading: Text(
                      CustomeLocalizaation.of(context)
                          .getTranslateValue("settings_about"),
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600))),
              onPressed: aboutApplication,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 35),
              leading: Text(
                  CustomeLocalizaation.of(context)
                      .getTranslateValue("settings_language"),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              trailing: selectLanguageBar(language),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 35),
              leading: Text(
                  CustomeLocalizaation.of(context)
                      .getTranslateValue("settings_darkmode"),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              trailing: Switch(
                  activeColor: theme.themePrimary,
                  value: theme.brightness == Brightness.dark,
                  onChanged: (value) {
                    theme.brightness == Brightness.dark
                        ? theme.switchToDarkMode(false)
                        : theme.switchToDarkMode(true);
                  }),
            ),
            FlatButton(
                padding: EdgeInsets.only(),
                child: ListTile(
                    contentPadding: EdgeInsets.only(left: 35),
                    leading: Text(
                        CustomeLocalizaation.of(context)
                            .getTranslateValue("settings_contactus"),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600))),
                onPressed: contractUsEmail),
            FlatButton(
              padding: EdgeInsets.only(),
              child: ListTile(
                  contentPadding: EdgeInsets.only(left: 35),
                  leading: Text(
                      CustomeLocalizaation.of(context)
                          .getTranslateValue("settings_rateapp"),
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600))),
              onPressed: () {},
            ),
            FlatButton(
              padding: EdgeInsets.only(),
              child: ListTile(
                  contentPadding: EdgeInsets.only(left: 35),
                  leading: Text(
                      CustomeLocalizaation.of(context)
                          .getTranslateValue("settings_shareapp"),
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600))),
              onPressed: shareApplicationSocial,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
