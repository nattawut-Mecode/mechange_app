import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mechange_app/models/language.dart';
import 'package:mechange_app/provider/Language.dart';

import 'package:provider/provider.dart';

import 'provider/bottom_navigation_index.dart';
import 'provider/is_buy.dart';
import 'provider/theme.dart';
import 'widgets/country_dropdown.dart';
import 'pages/settings.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) =>
            ThemeProvider(themePrimary: Color.fromRGBO(5, 105, 107, 1))),
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
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: theme.brightness,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Raleway"),
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

  static const List<String> _listTitle = [
    "MeChange",
    "Historical Trends",
    "Financial News",
    "Explore",
    "Settings",
  ];

  List<Widget> _pages = [
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.orange,
    ),
    SettingsPage()
  ];

  String dropdownValue = "USD";

  BottomNavigationBarItem bottomNavigator(bool active, String activeAsset,
      String unActiveAsset, String title, ThemeProvider themeProvider) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(active ? activeAsset : unActiveAsset),
        title: Text(
          title,
          style: TextStyle(
              color: active ? themeProvider.themePrimary : Colors.black),
        ));
  }

  AppBar appBar(BottomNavigationIndexProvider selectedIndex,
      ThemeProvider theme, BuyProvider isBuy) {
    return AppBar(
        title: Row(
          children: [
            selectedIndex.selectedIndex == 0
                ? SvgPicture.asset(
                    "assets/logos/Logo_White_nobg.svg",
                    width: 30,
                    height: 30,
                  )
                : Container(),
            SizedBox(width: 15),
            Text(_listTitle[selectedIndex.selectedIndex],
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
                      onPressed: () {}),
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
                  child: Text("I BUY",
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
                    "I SELL",
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
          color: Colors.white,
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

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    final selectedIndex = Provider.of<BottomNavigationIndexProvider>(context);
    final isBuy = Provider.of<BuyProvider>(context);
    return Scaffold(
      appBar: appBar(selectedIndex, theme, isBuy),
      body: _pages[selectedIndex.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          selectedIndex.changeSelectedIndex(index);
        },
        currentIndex: selectedIndex.selectedIndex,
        items: [
          bottomNavigator(
              selectedIndex.selectedIndex == 0,
              "assets/icons/usd-circle_select.svg",
              "assets/icons/usd-circle.svg",
              "Currency",
              theme),
          bottomNavigator(
              selectedIndex.selectedIndex == 1,
              "assets/icons/analytics_select.svg",
              "assets/icons/analytics.svg",
              "Trends",
              theme),
          bottomNavigator(
              selectedIndex.selectedIndex == 2,
              "assets/icons/rss_select.svg",
              "assets/icons/rss.svg",
              "News",
              theme),
          bottomNavigator(
              selectedIndex.selectedIndex == 3,
              "assets/icons/map-marked__select.svg",
              "assets/icons/map-marked.svg",
              "News",
              theme),
          bottomNavigator(
              selectedIndex.selectedIndex == 4,
              "assets/icons/cog_select.svg",
              "assets/icons/cog.svg",
              "Settings",
              theme),
        ],
      ),
    );
  }
}
