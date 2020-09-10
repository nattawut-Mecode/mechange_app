import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:animations/animations.dart';

import 'pages/currency.dart';
import 'components/calculate_bottomsheet.dart';
import 'data/infomation.dart';
import 'internationalization/custome_internationalization.dart';
import 'internationalization/util.dart';
import 'models/language.dart';
import 'provider/language.dart';
import 'themes/themes.dart';
import 'provider/bottom_navigation_index.dart';
import 'provider/is_buy.dart';
import 'provider/theme.dart';
import 'components/country_dropdown.dart';
import 'pages/settings.dart';
import 'components/trends_currency.dart';

void main() {
  SyncfusionLicense.registerLicense("FT8mJyc2IWhia31hfWN9Z2doYmF8YGJ8ampqanNiYmlmamlmanMDHmgmPT88MDgxKiA2JyYjEyAqPTA1JiA6PD19MDw+");
  runApp(
    MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) => ThemeProvider(themePrimary: ThemeApp.primaryColor,brightness: SchedulerBinding.instance.window.platformBrightness)),
    ChangeNotifierProvider(create: (_) => BottomNavigationIndexProvider()),
    ChangeNotifierProvider(create: (_) => BuyProvider()),
    ChangeNotifierProvider(
        create: (_) => LanguageProvider(language: Language.EN))
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    final language = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      locale: getLocalefromLanguage(language.language),
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        CustomeLocalizaation.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'EN'), // English, no country code
        const Locale('th', 'TH'), // Hebrew, no country code
        const Locale('zh', 'ZH'), // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
      theme: ThemeData(
          primaryColor: Colors.green,
          accentColor: Colors.green,
          brightness: theme.brightness,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: language.language == Language.TH?"Kanit":"Raleway"),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _listCountry = <String>[
    "USD",
    "JPY",
    "IDR",
    "PHP",
    "RUB",
  ];

  double randomDouble(){
    return new Random().nextDouble();
  }

  List _listTitle(BuildContext context) {
    return [
      CustomeLocalizaation.of(context).getTranslateValue("homepage_title"),
      CustomeLocalizaation.of(context).getTranslateValue("trends_title"),
      CustomeLocalizaation.of(context).getTranslateValue("news_title"),
      CustomeLocalizaation.of(context).getTranslateValue("explore_title"),
      CustomeLocalizaation.of(context).getTranslateValue("settings_title")
    ];
  }

  List<Widget> _pages = [
    CurrencyPage(),
    Container(
      color: Color.fromRGBO(240, 240, 240,1),
      child: Container(
        margin: const EdgeInsets.only(left: 19,top: 15,right: 19,bottom: 15),
        child: ListView(
          children: <Widget>[
            TrendsCurrency(shortCurrency: "THB",exchnageRate: Random().nextDouble(),isLike: true,isExpand: false,),
            TrendsCurrency(shortCurrency: "IDR",exchnageRate:Random().nextDouble(),isLike: true,isExpand: true,),
            TrendsCurrency(shortCurrency: "USD",exchnageRate: Random().nextDouble(),isLike: true,isExpand: true,)
          ],
        ),
      ),
    ),
    Container(),
    Container(),
    SettingsPage()
  ];

  String dropdownValue = "USD";

  BottomNavigationBarItem bottomNavigator(
      bool active,
      String activeAsset,
      String unActiveAsset,
      String darkModeAssets,
      String title,
      ThemeProvider themeProvider) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 2.5),
          child: SvgPicture.asset((active
              ? activeAsset
              : themeProvider.brightness == Brightness.dark
                  ? darkModeAssets
                  : unActiveAsset)),
        ),
        title: Text(
          title,
          style: TextStyle(
              color: active
                  ? themeProvider.themePrimary
                  : (themeProvider.brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)),
        ));
  }

  AppBar appBar(BottomNavigationIndexProvider selectedIndex,
      ThemeProvider theme, BuyProvider isBuy, LanguageProvider language) {
    return AppBar(
        title: Row(
          children: [
            selectedIndex.selectedIndex == 0
                ? SvgPicture.asset(
                    Infomation.assetsLogoNoBG,
                    width: 30,
                    height: 30,
                  )
                : Container(),
            SizedBox(width: 15),
            Text(_listTitle(context)[selectedIndex.selectedIndex],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700)),
          ],
        ),
        actions: [
          selectedIndex.selectedIndex == 0
              ? Padding(
                  padding: const EdgeInsets.only(right: 7.5),
                  child: IconButton(
                      icon: Image.asset(
                        "assets/icons/calculator.png",
                        width: 25,
                        height: 25,
                      ),
                      onPressed: showBottomSheetModel),
                )
              : Container()
        ],
        backgroundColor: theme.themePrimary,
        bottom: bottomAppBar(selectedIndex, isBuy, theme));
  }

  Widget dropDownCountry() {
    return Expanded(
        child: Container(
            margin: EdgeInsets.only(left: 20),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(
                Icons.arrow_drop_down,
                size: 30,
              ),
              iconSize: 24,
              elevation: 16,
              underline: Container(),
              onChanged: (newValue) {
                setState(() {
                  dropdownValue = newValue;
                  //currencyController.add(newValue);
                });
              },
              items: _listCountry.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: CountryDropDownItem(
                    shortCurrency: value,
                  ),
                );
              }).toList(),
            )));
  }

  Widget toggleButtonCurrencyMode(BuyProvider isBuy, ThemeProvider theme) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 22),
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                isBuy.changeBuyMode(true);
              },
              child: Container(
                width: 65,
                height: 35,
                child: Center(
                  child: Text(
                      CustomeLocalizaation.of(context)
                          .getTranslateValue("currency_ibuy"),
                      style: TextStyle(
                          fontSize: 12.5,
                          color: isBuy.isBuy ? Colors.white : Colors.grey)),
                ),
                decoration: BoxDecoration(
                    color:
                        isBuy.isBuy ? theme.themePrimary : Colors.transparent,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            GestureDetector(
              onTap: () {
                isBuy.changeBuyMode(false);
              },
              child: Container(
                width: 65,
                height: 35,
                child: Center(
                  child: Text(
                    CustomeLocalizaation.of(context)
                        .getTranslateValue("currency_isell"),
                    style: TextStyle(
                        fontSize: 12.5,
                        color:
                            isBuy.isBuy == false ? Colors.white : Colors.grey),
                  ),
                ),
                decoration: BoxDecoration(
                    color: isBuy.isBuy == false
                        ? theme.themePrimary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(5)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bottomAppBar(BottomNavigationIndexProvider selectedIndex,
      BuyProvider isBuy, ThemeProvider theme) {
    return PreferredSize(
      preferredSize:
          Size.fromHeight(selectedIndex.selectedIndex == 0 ? 52.5 : 0),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: selectedIndex.selectedIndex == 0 ? 1 : 0,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 350),
          height: selectedIndex.selectedIndex == 0 ? 48 : 0,
          color: theme.brightness == Brightness.dark
              ? ThemeApp.darkColor
              : Colors.white,
          child: Row(
            children: <Widget>[
              dropDownCountry(),
              toggleButtonCurrencyMode(isBuy, theme)
            ],
          ),
        ),
      ),
    );
  }

  showBottomSheetModel() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return CalculatorBottomSheet(
            form: "USD",
            to: dropdownValue,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    final selectedIndex = Provider.of<BottomNavigationIndexProvider>(context);
    final isBuy = Provider.of<BuyProvider>(context);
    final language = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: appBar(selectedIndex, theme, isBuy, language),
      body: PageTransitionSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (child, animation, secondaryAniamtion) {
          return SharedAxisTransition(
              child: child,
              animation: animation,
              secondaryAnimation: secondaryAniamtion,
              transitionType: SharedAxisTransitionType.vertical);
        },
        child: _pages[selectedIndex.selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: theme.brightness == Brightness.dark? ThemeApp.darkColor:Colors.white,
        onTap: (index) {
          selectedIndex.changeSelectedIndex(index);
        },
        currentIndex: selectedIndex.selectedIndex,
        items: [
          bottomNavigator(
              selectedIndex.selectedIndex == 0,
              "assets/icons/usd-circle_select.svg",
              "assets/icons/usd-circle.svg",
              "assets/icons/usd-circle white.svg",
              CustomeLocalizaation.of(context)
                  .getTranslateValue("navigation_currency"),
              theme),
          bottomNavigator(
              selectedIndex.selectedIndex == 1,
              "assets/icons/analytics_select.svg",
              "assets/icons/analytics.svg",
              "assets/icons/analytics white.svg",
              CustomeLocalizaation.of(context)
                  .getTranslateValue("navigation_trends"),
              theme),
          bottomNavigator(
              selectedIndex.selectedIndex == 2,
              "assets/icons/rss_select.svg",
              "assets/icons/rss.svg",
              "assets/icons/rss white.svg",
              CustomeLocalizaation.of(context)
                  .getTranslateValue("navigation_news"),
              theme),
          bottomNavigator(
              selectedIndex.selectedIndex == 3,
              "assets/icons/map-marked__select.svg",
              "assets/icons/map-marked.svg",
              "assets/icons/map-marked white.svg",
              CustomeLocalizaation.of(context)
                  .getTranslateValue("navigation_explore"),
              theme),
          bottomNavigator(
              selectedIndex.selectedIndex == 4,
              "assets/icons/cog_select.svg",
              "assets/icons/cog.svg",
              "assets/icons/cog white.svg",
              CustomeLocalizaation.of(context)
                  .getTranslateValue("navigation_settings"),
              theme),
        ],
      ),
    );
  }
}
