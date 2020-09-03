import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mechange_app/provider/bottom_navigation_index.dart';
import 'package:mechange_app/provider/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) =>
            ThemeProvider(themePrimary: Color.fromRGBO(5, 105, 107, 1))),
    ChangeNotifierProvider(create: (_) => BottomNavigationIndexProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
  int _counter = 0;

  String title = "MeChange";

  BottomNavigationBarItem bottomNavigator(bool active,String activeAsset,String unActiveAsset,String title,ThemeProvider themeProvider){
    return BottomNavigationBarItem(
              icon: SvgPicture.asset(active?activeAsset:unActiveAsset),
              title: Text(title,style: TextStyle(color: active? themeProvider.themePrimary:Colors.black),));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    final selectedIndex = Provider.of<BottomNavigationIndexProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              "assets/logos/Logo_White_nobg.svg",
              width: 30,
              height: 30,
            ),
            SizedBox(width: 15),
            Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 7.5),
            child: IconButton(
                icon: Image.asset(
                  "assets/icons/calculator.png",
                  width: 25,
                  height: 25,
                ),
                onPressed: () {}),
          )
        ],
        backgroundColor: theme.themePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          selectedIndex.changeSelectedIndex(index);
        },
        currentIndex: selectedIndex.selectedIndex,
        items: [
          bottomNavigator(selectedIndex.selectedIndex == 0,"assets/icons/usd-circle_select.svg","assets/icons/usd-circle.svg","Currency",theme),
          bottomNavigator(selectedIndex.selectedIndex == 1,"assets/icons/analytics_select.svg","assets/icons/analytics.svg","Trends",theme),
          bottomNavigator(selectedIndex.selectedIndex == 2,"assets/icons/rss_select.svg","assets/icons/rss.svg","News",theme),
          bottomNavigator(selectedIndex.selectedIndex == 3,"assets/icons/map-marked__select.svg","assets/icons/map-marked.svg","News",theme),
          bottomNavigator(selectedIndex.selectedIndex == 4,"assets/icons/cog_select.svg","assets/icons/cog.svg","Settings",theme),
        ],
      ),
    );
  }
}
